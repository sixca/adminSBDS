package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Member;
import com.kbstar.service.MemberService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    BCryptPasswordEncoder encoder;

    @Autowired
    MemberService memberService;
    String dir = "member/";

    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Member> list = null;
        list = memberService.get();
        model.addAttribute("mlist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    @RequestMapping("/detail")   //로그인 사용자 아이디 클릭 시 상세정보조회
    public String detail(Model model, Integer id) throws Exception {
        Member member =null;
        try {
            member = memberService.get(id);
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("memberinfo", member);
        model.addAttribute("center", dir+"detail");     //센터에 정보를 뿌림. 익숙해 지세요!
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Member member, Errors errors) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();    //Member에 담아둔(DefaultMessage) 어노테이션과 message
            String msg ="";
            for(ObjectError e:es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        MultipartFile mf = member.getImgMember();   // 파일덩어리
        String new_imgname = mf.getOriginalFilename();   // 파일덩어리에서 이름을 꺼내온다
        if (new_imgname.equals("") || new_imgname == null) {   //이미지 지정이 따로 없으면, 기존 이미지를 그대로 쓰겠다
            memberService.modify(member);
        }else {
            member.setImg(new_imgname); //아니면 (새 이미지를 지정했다면) item 전체 업데이트 쳐라.
            memberService.modify(member);
            FileUploadUtil.saveFile(mf, imgdir);     // 경로에 업로드
        }
//        return "redirect:/member/detail?id="+member.getId();
        return "redirect:/member/all";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        memberService.remove(id);
        return "redirect:/member/all";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model, Member member, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        log.info("===============EMAIL!!!!!"+member.getSearch1());
        log.info("===============NAME!!!!!"+member.getSearch2());
        log.info("===============STARTDATE!!!!!"+member.getStartDate());
        log.info("===============ENDDATE!!!!!"+member.getEndDate());
        PageInfo<Member> p = new PageInfo<>(memberService.getFindPage(pageNo, member), 5);
        model.addAttribute("value1",member.getSearch1());
        model.addAttribute("value2",member.getSearch2());
        model.addAttribute("value3",member.getStartDate());
        model.addAttribute("value4",member.getEndDate());
        model.addAttribute("target","member");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"all");
        model.addAttribute("member", member);
        return "index";
    }

    // member > valid 상태변경 기능 (활동 or 정지)
//    @PostMapping("/updateStatus")
//    @ResponseBody
//    public void updateStatus(@PathVariable("id") Integer id, @RequestParam("valid") Integer valid) {
//        memberService.updateStatus(id, valid);
//    }

    @PostMapping("/updateStatus/{id}")
    @ResponseBody
    public void updateStatus(@PathVariable("id") Integer id, @RequestParam("valid") Integer valid) {
        memberService.updateStatus(id, valid);
    }

}
