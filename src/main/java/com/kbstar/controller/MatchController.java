package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Match;
import com.kbstar.dto.Mate;
import com.kbstar.service.MatchService;
import com.kbstar.service.MateService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/match")
public class MatchController {

    @Autowired
    MateService mateService;

    @Autowired
    MatchService matchService;

    @Value("${uploadimgdir}")
    String uploadimgdir;

    String dir = "match/";

    //매칭 상세분석
    @RequestMapping("/analysis")
    public String analysis(Model model) {

        List<Mate> list = null;
        list = mateService.getTOP10List();

        List<Mate> matchedlist = null;
        matchedlist = mateService.getMatchedMemberImgAll();

        model.addAttribute("matchedlist", matchedlist);
        model.addAttribute("top10list", list);
        model.addAttribute("center", dir + "analysis");
        return "index";
    }

    //pagination+search
    @RequestMapping("/findimpl")
    public String findimpl(Model model, Match match, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        log.info("===============EMAIL!!!!!"+match.getSearch1());
        log.info("===============NAME!!!!!"+match.getSearch2());
        log.info("===============STARTDATE!!!!!"+match.getStartDateTo());
        log.info("===============ENDDATE!!!!!"+match.getStartDateFrom());
        PageInfo<Match> p = new PageInfo<>(matchService.getFindPage(pageNo, match), 5);
        model.addAttribute("value1",match.getSearch1());
        model.addAttribute("value2",match.getSearch2());
        model.addAttribute("value3",match.getStartDateTo());
        model.addAttribute("value4",match.getStartDateFrom());
        model.addAttribute("target","match");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"all");
        model.addAttribute("search", match);
        return "index";
    }

    // status 변경 :: 버튼 클릭으로 id별 상태 변경 기능
    @PostMapping("/updateStatus/{id}")
    @ResponseBody
    public void updateStatus(@PathVariable("id") Integer id, @RequestParam("status") String status) {
        // status를 문자열 그대로 사용하여 처리
        matchService.updateStatus(id, status);
    }
}