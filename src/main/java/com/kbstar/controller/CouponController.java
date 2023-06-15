package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Coupon;
import com.kbstar.dto.Search;
import com.kbstar.service.CouponService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/coupon")
public class CouponController {

    @Autowired
    CouponService service;

    String dir = "coupon/";

    @RequestMapping("/all")
    public String all(Model model){
        List<Coupon> coupons = null;
        try {
            coupons = service.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("coupons", coupons);
        model.addAttribute("center",dir + "all");
        return "index";
    }

    @RequestMapping("/registerImpl")
    public String registerImpl(Model model, Coupon coupon) throws Exception {
        service.register(coupon);
        return "redirect:/coupon/findimpl?keyword1=id&keyword2=num&keyword3=amount&search1=&search2=&search3=";
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(int id) throws Exception {
        service.remove(id);
        return "redirect:/coupon/findimpl?keyword1=id&keyword2=num&keyword3=amount&search1=&search2=&search3=";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model, Search search, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        log.info(search.getSearch1());
        log.info(search.getSearch2());
        log.info(search.getSearch3());
        PageInfo<Coupon> p = new PageInfo<>(service.getFindPage(pageNo, search), 5);
        model.addAttribute("value1",search.getSearch1());
        model.addAttribute("value2",search.getSearch2());
        model.addAttribute("value3",search.getSearch3());
        model.addAttribute("target","coupon");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"all");
        model.addAttribute("search", search);
        return "index";
//        return "redirect:/";
    }
}