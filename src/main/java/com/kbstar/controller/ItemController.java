package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Item;
import com.kbstar.dto.Notice;
import com.kbstar.service.ItemService;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService service;

    @Value("${uploadimgdir}")
    String uploadimgdir;

    String dir = "item/";

    @RequestMapping("/all")
    public String productall(Model model){

        List<Item> items = null;
        try {
            items = service.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("items", items);
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/{id}")
    public String detail(Model model, @PathVariable int id) throws Exception {
        Item item = service.get(id);
        model.addAttribute("item", item);
        model.addAttribute("center", dir + "updateProduct");
        return "index";
    }

//    @RequestMapping("/registerImpl")
//    public String registerImpl(Model model, Item item) throws Exception {
//        MultipartFile mf =  item.getImgName();
//
//        //파일에서 이미지를 끄집어 낸다.
//        String imgname = mf.getOriginalFilename();
//        item.setImg(imgname);
//
//        //db에 파일 저장
//        service.register(item);
//
//        //이미지 저장 디렉토리에 이미지를 저장한다.
//        //우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
//        FileUploadUtil.saveFile(mf, uploadimgdir);
//        log.info("item.getRegisterId={}", item.getRegisterId());
//        return "redirect:/item/productall";
//    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center",dir + "registerItem");
        return "index";
    }

    @RequestMapping("/registerImpl")
    public String registerImpl(HttpSession session, Model model, Item item, @ModelAttribute("adm") Adm adm) throws Exception {
        MultipartFile mf = item.getImgName();

        // 파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        item.setImg(imgname);

        // db에 데이터 저장
        service.register(item);

        // 이미지 저장 디렉토리에 이미지를 저장한다.
        // 우리가 업로드한 파일이 원하는 폴더로 들어간다(static으로 호출해서 함수 사용)
        FileUploadUtil.saveFile(mf, uploadimgdir);

        // 로그인된 관리자의 ID를 "loginadm" 속성으로 HttpSession에 저장 :: JSP에서는 ${loginadm}으로 끌어온다
        model.addAttribute("loginadm", adm);
//        model.addAttribute("loginadm", adm.getId());

        log.info("===========notice.getAdmId={}", item.getRegisterId());
        return "redirect:/item/all";
    }

    @RequestMapping("/updateImpl")
    public String updateImpl(Model model, Item item) throws Exception {
        MultipartFile mf =  item.getImgName();
        //파일에서 이미지를 끄집어 낸다.
        String imgname = mf.getOriginalFilename();
        if (imgname.equals("") || imgname == null) {
            service.modify(item);
        } else {
            item.setImg(imgname);

            service.modify(item);
            FileUploadUtil.saveFile(mf, uploadimgdir);
        }
        return "redirect:/item/" + item.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(int id) throws Exception {
        service.remove(id);
        return "redirect:/item/all";
    }
}