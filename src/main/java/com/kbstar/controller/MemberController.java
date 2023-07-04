package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.*;
import com.kbstar.service.MemberCRMCommentService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    BCryptPasswordEncoder encoder;

    @Autowired
    MemberService memberService;

    @Autowired
    MemberCRMCommentService memberCRMCommentService;

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

    @GetMapping("/detail")   //로그인 사용자 아이디 클릭 시 상세정보조회
    public String detail(Model model, Integer id) throws Exception {
        Member member =null;
        List<MemberCRMComment> memberCRMComments = null;
        try {
            member = memberService.get(id);
            memberCRMComments = memberCRMCommentService.get(); // 전체 코멘트 소환
        } catch (Exception e) {
            throw new Exception("시스템 장애");
        }
        model.addAttribute("comment",memberCRMComments);  // 코멘트 model에 박고
        model.addAttribute("memberinfo", member);
        model.addAttribute("center", dir+"detail");
        model.addAttribute("memberId", id); // detail 화면의 id 값을 memberId로 전달해서 아래 /membercrmcommentregister에서 매핑
        return "index";
    }

    // Member CRM 코멘트 등록
    @PostMapping("/membercrmcommentregister")
    public String membercrmcommentregister(Model model,
                                            HttpSession session,
                                            @ModelAttribute("adm") Adm adm,
                                            @RequestParam("memberId") Integer memberId,
                                            @RequestParam("comment") String comment) {
        // 로그인 정보 가져오기
        String adminId = adm.getAdminId();

        //detail화면에 저장된 data 가져와서 set
        MemberCRMComment memberCRMComment = new MemberCRMComment();
        memberCRMComment.setAdminId(adminId);
        memberCRMComment.setMemberId(memberId);
        memberCRMComment.setCrmComment(comment);
        // id=seq, rdate=sysdate

        try {
            memberCRMCommentService.register(memberCRMComment);
            System.out.println("=========!!!!!!!!!!success!!!!!!!!!!!========: " + comment);
            System.out.println("============success==========: " + adminId);
            System.out.println("===========success==========: " + memberId);
            // 댓글 등록 성공
        } catch (Exception e) {
            // 댓글 등록 실패
            log.info(e.toString());
            System.out.println("============adminId==========: " + adminId);
            System.out.println("===========memberId==========: " + memberId);
            System.out.println("=========comment========: " + comment);
            e.printStackTrace();
            // 오류 처리 로직 추가
        }

        model.addAttribute("loginadm", adm);
        // 직전 화면으로 리다이렉트
        return "redirect:/member/detail?id=" + memberCRMComment.getMemberId();
    }

    // Member CRM 코멘트 등록
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
        return "redirect:/member/detail?id="+member.getId();
//        return "redirect:/member/all";

    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        memberService.remove(id);
        return "redirect:/member/all";
    }

    // Member all : Pagination & Search
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

    //Member CRM Comment 삭제
    @RequestMapping("/deletecommentimpl")
    public String deletecommentimpl(Model model, Integer id, HttpServletRequest request) throws Exception {
        memberCRMCommentService.remove(id);

        // HttpServletRequest을 활용하여 기존 페이지의 URL을 얻어옴 = referer :: 삭제 후 화면유지
        String referer = request.getHeader("Referer");
        if (referer == null || referer.isEmpty()) {
            // 기존 페이지의 URL이 없을 경우 기본 URL로 이동
            return "redirect:/";
        } else {
            // 기존 페이지의 URL로 이동
            return "redirect:" + referer;
        }
    }

    // member > valid 상태변경 기능 (활동 or 정지)
    @PostMapping("/updateStatus/{id}")
    @ResponseBody
    public void updateStatus(@PathVariable("id") Integer id, @RequestParam("valid") Integer valid) {
        memberService.updateStatus(id, valid);
    }

}
