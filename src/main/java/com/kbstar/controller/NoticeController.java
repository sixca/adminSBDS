package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Adm;
import com.kbstar.dto.Notice;
import com.kbstar.service.NoticeService;
import com.kbstar.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
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

    // 공지 리스트 Pagination
    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Notice> p;
        try {
            p = new PageInfo<>(service.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("페이징 오류");
        }
        model.addAttribute("target","notice");

        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"allpage");
        return "index";
    }

    // Notice Detail & update
    @RequestMapping("/{id}")
    public String detail(Model model, @PathVariable int id) throws Exception {
        Notice notice = service.get(id);
        model.addAttribute("notice", notice);
        model.addAttribute("center", dir + "updateNotice");
        return "index";
    }

    // Notice 신규등록
    @RequestMapping("/registerImpl")
    public String registerImpl(HttpSession session, Model model, Notice notice, @ModelAttribute("adm") Adm adm) throws Exception {
        MultipartFile mf = notice.getImgName();

        // 파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        notice.setImg(imgname);

        // db에 데이터 저장
        service.register(notice);

        // 이미지 저장 디렉토리에 이미지를 저장한다.
        // 우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
        FileUploadUtil.saveFile(mf, uploadimgdir);

        // 로그인된 관리자의 ID를 "loginadm" 속성으로 HttpSession에 저장 :: JSP에서는 ${loginadm}으로 끌어온다
//        model.addAttribute("loginadm", adm.getId());
        model.addAttribute("loginadm", adm);

        log.info("===========notice.getAdmId={}", notice.getAdmId());
        return "redirect:/notice/allpage";
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
        return "redirect:/notice/allpage";
    }

    // 서치조건 독립 추가
    @RequestMapping("/search")
    public String search(Model model, Notice ns) {
        try {
            List<Notice> list = service.search(ns);
            model.addAttribute("ns", ns);
            model.addAttribute("searchlist", list);
            model.addAttribute("center", dir + "allpage");
            return "index";
        } catch (Exception e) {
            // 예외 정보 출력
            e.printStackTrace();
            return "error";
        }
    }

}