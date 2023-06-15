package com.kbstar.controller;

import com.kbstar.dto.ItemReview;
import com.kbstar.service.ItemReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/itemreview")
public class ItemReviewController {

    @Autowired
    ItemReviewService service;

    String dir = "itemreview/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<ItemReview> list = null;
        list = service.get();

        model.addAttribute("ilist", list);
        model.addAttribute("center", dir + "all");
        return "index2";
    }

    @RequestMapping("/detail")   //상세리뷰조회
    public String detail(Model model, Integer id) throws Exception {
        ItemReview itemReview = null;
        try {
            itemReview = service.get(id);
        } catch (Exception e) {
            throw new Exception("오류 :: 리뷰 불러오기 실패");
        }
        model.addAttribute("ireviewinfo", itemReview);
        model.addAttribute("center", dir + "detail");
        return "index2";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        service.remove(id);
        return "redirect:/itemreview/all";
    }
}