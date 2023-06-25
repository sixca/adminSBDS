package com.kbstar.controller;

import com.kbstar.dto.Notice;
import com.kbstar.service.NoticeService;
import com.kbstar.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeService service;

    @Value("${uploadimgdir}")
    String uploadimgdir;

    String dir = "notice/";

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center",dir + "registerNotice");
        return "index";
    }

    @RequestMapping("/noticeall")
    public String noticeall(Model model){

        List<Notice> notices = null;
        try {
            notices = service.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("notices", notices);
        model.addAttribute("center",dir + "noticeall");
        return "index";
    }

    @RequestMapping("/{id}")
    public String detail(Model model, @PathVariable int id) throws Exception {
        Notice notice = service.get(id);
        model.addAttribute("notice", notice);
        model.addAttribute("center", dir + "updateNotice");
        return "index";
    }

    @RequestMapping("/registerImpl")
    public String registerImpl(Model model, Notice notice) throws Exception {
        MultipartFile mf =  notice.getImgName();

        //파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        notice.setImg(imgname);

        //db에 파일 저장
        service.register(notice);

        //이미지 저장 디렉토리에 이미지를 저장한다.
        //우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
        FileUploadUtil.saveFile(mf, uploadimgdir);
        log.info("===========notice.getAdmId={}", notice.getAdmId());
        return "redirect:/notice/noticeall";
    }

    @RequestMapping("/updateImpl")
    public String updateImpl(Model model, Notice notice) throws Exception {
        MultipartFile mf =  notice.getImgName();
        //파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        if (imgname.equals("") || imgname == null) {
            service.modify(notice);
        } else {
            notice.setImg(imgname);

            service.modify(notice);
            FileUploadUtil.saveFile(mf, uploadimgdir);
        }
        return "redirect:/notice/" + notice.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(int id) throws Exception {
        service.remove(id);
        return "redirect:/notice/noticeall";
    }
}