package com.kbstar.controller;

import com.kbstar.dto.ItemReview;
import com.kbstar.dto.ItemReviewDto;
import com.kbstar.service.ItemReviewService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/review")
public class ItemReviewController {

    @Autowired
    ItemReviewService service;

    String dir = "itemreview/";

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<ItemReviewDto> list = null;
        list = service.get();

        model.addAttribute("ilist", list);
        model.addAttribute("center", dir + "all");
        return "index";
    }


    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        service.remove(id);
        return "redirect:/itemreview/all";
    }
}