package com.kbstar.controller;

import com.kbstar.dto.MateReview;
import com.kbstar.service.MateReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/matereview")
public class MateReviewController {

    @Autowired
    MateReviewService service;

//    @Autowired
//    MateService MateService;
//
//    @Autowired
//    MemberService MemberService;

    String dir = "matereview/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<MateReview> list = null;
        list = service.get();

//        List<Mate> MateList = MateService.get();
//        List<Member> MemberList = MemberService.get();
//
//        model.addAttribute("MateList", MateList);
//        model.addAttribute("MemberList", MemberList);

        model.addAttribute("rlist", list);
        model.addAttribute("center", dir+"all");
        return "index2";
    }

    @RequestMapping("/detail")   //상세리뷰조회
    public String detail(Model model, Integer id) throws Exception {
        MateReview mateReview =null;
        try {
            mateReview = service.get(id);
        } catch (Exception e) {
            throw new Exception("오류 :: 리뷰 불러오기 실패");
        }
        model.addAttribute("mreviewinfo", mateReview);
        model.addAttribute("center", dir+"detail");
        return "index2";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        service.remove(id);
        return "redirect:/matereview/all";
    }
}