package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.*;
import com.kbstar.service.AdmService;
import com.kbstar.service.MateReviewCommentService;
import com.kbstar.service.MateReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/matereview")
public class MateReviewController {

    @Autowired
    MateReviewService service;

    @Autowired
    MateReviewCommentService mateReviewCommentService;

    @Autowired
    AdmService admService;

    String dir = "matereview/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<MateReview> list = null;
        list = service.get();

        model.addAttribute("rlist", list);
        model.addAttribute("center", dir+"all");
        return "index";
    }

    // Mate 후기 페이지네이션 독립 추가
    @RequestMapping("/allpage")
    public String allpage(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<MateReview> p;
        try {
            p = new PageInfo<>(service.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            throw new Exception("페이징 오류");
        }
        model.addAttribute("target","matereview");

        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"allpage");
        return "index";
    }


    @GetMapping("/detail")   //상세리뷰조회
    public String detail(Model model, Integer id) throws Exception {
        MateReview mateReview =null;
        List<MateReviewComment> mateReviewComment = null;
        try {
            mateReview = service.get(id);
            mateReviewComment = mateReviewCommentService.get(); //댓글 전체 소환
        } catch (Exception e) {
            throw new Exception("오류 :: 리뷰 불러오기 실패");
        }
        model.addAttribute("comment",mateReviewComment);  // 댓글 model에 박고
        model.addAttribute("mreviewinfo", mateReview);
        model.addAttribute("center", dir+"detail");
        model.addAttribute("reviewId", id); // id 값을 reviewId로 전달해서 아래 /matereviewcommentregister에서 매핑
        return "index";
    }

    // Mate 리뷰에 댓글 등록
    @PostMapping("/matereviewcommentregister")
    public String matereviewcommentregister(Model model,
                                            HttpSession session,
                                            @ModelAttribute("adm") Adm adm,
                                            @RequestParam("reviewId") Integer reviewId,
                                            @RequestParam("comment") String comment) {
        // 로그인 정보 가져오기
        String adminId = adm.getAdminId();

        //detail화면에 저장된 data 가져와서 set
        MateReviewComment mateReviewComment = new MateReviewComment();
        mateReviewComment.setAdminId(adminId);
        mateReviewComment.setReviewId(reviewId);
        mateReviewComment.setMateComment(comment);
        // id=seq, rdate=sysdate

        try {
            mateReviewCommentService.register(mateReviewComment);
            // 댓글 등록 성공
        } catch (Exception e) {
            // 댓글 등록 실패
            e.printStackTrace();
            // 오류 처리 로직 추가
        }

        model.addAttribute("loginadm", adm);
        // 직전 화면으로 리다이렉트
        return "redirect:/matereview/detail?id=" + mateReviewComment.getReviewId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        service.remove(id);
        return "redirect:/matereview/allpage";
    }

    // Mate 리뷰에 댓글 삭제
    @RequestMapping("/deletecommentimpl")
    public String deletecommentimpl(Model model, Integer id, HttpServletRequest request) throws Exception {
        mateReviewCommentService.remove(id);

        // HttpServletRequest을 활용하여 기존 페이지의 URL을 얻어옴 = referer
        String referer = request.getHeader("Referer");
        if (referer == null || referer.isEmpty()) {
            // 기존 페이지의 URL이 없을 경우 기본 URL로 이동
            return "redirect:/";
        } else {
            // 기존 페이지의 URL로 이동
            return "redirect:" + referer;
        }
    }

    // Mate all 에 독릭 서치 조건 추가
    @RequestMapping("/search")
    public String search(Model model, MateReview mr) throws Exception {
        List<MateReview> list = null;
        list = service.search(mr);
        model.addAttribute("mr",mr);
        model.addAttribute("mrlist",list);
        model.addAttribute("center",dir+"allpage");
        return "index";
    }

}
