package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Mate;
import com.kbstar.dto.MateReview;
import com.kbstar.dto.MateReviewRate;
import com.kbstar.dto.Member;
import com.kbstar.service.MatchService;
import com.kbstar.service.MateReviewService;
import com.kbstar.service.MateService;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/mate")
public class MateController {

    @Autowired
    BCryptPasswordEncoder encoder;

    @Autowired
    MateService mateService;
    @Autowired
    MateReviewService mateReviewService;
    @Autowired
    MatchService matchService;

    String dir = "mate/";

    @Value("${uploadimgdir}")
    String imgdir;

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("center", dir + "add");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, @Validated Mate mate, Errors errors) throws Exception {   //mate에 문제가 생기면, errors 저장. validation
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();    //Mate에 담아둔(DefaultMessage) 어노테이션과 message
            String msg = "";
            for (ObjectError e : es) {
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        MultipartFile mf = mate.getImgMate();   // 파일덩어리
        String new_imgname = mf.getOriginalFilename();   // 파일덩어리에서 이름을 꺼내온다
        mate.setImg(new_imgname); //img 셋
        mate.setPassword(encoder.encode(mate.getPassword()));  //password 셋
        mateService.register(mate);
        FileUploadUtil.saveFile(mf, imgdir); // 이미지 파일은 경로에 업로드
        return "redirect:/mate/all";
    }

    @RequestMapping("/all")
    public String all(Model model) throws Exception {
        List<Mate> list = null;
        list = mateService.get();

        //mate 전체 리뷰리스트를 rlist로 addAttr
        List<MateReviewRate> rlist = mateReviewService.mateRateAll();

        model.addAttribute("rlist", rlist);
        model.addAttribute("mlist", list);
        model.addAttribute("center", dir + "all");
        return "index";
    }

    @RequestMapping("/detail")   //로그인 사용자 아이디 클릭 시 상세정보조회
    public String detail(Model model, Integer id) throws Exception {
        Mate mate = null;
        List<Mate> matchedlist = null;
        try {
            mate = mateService.get(id);
            matchedlist = mateService.getMatchedMemberImgAll();

        } catch (Exception e) {
            throw new Exception("오류 :: 간병인 불러오기 실패");
        }

        List<MateReview> list = null;
        list = mateReviewService.getByMateId(id);
        model.addAttribute("rlist", list);
        model.addAttribute("matchedlist", matchedlist);
        model.addAttribute("mateinfo", mate);
        model.addAttribute("center", dir + "detail");     //센터에 정보를 뿌림. 익숙해 지세요!
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, @Validated Mate mate, Errors errors) throws Exception {
        if (errors.hasErrors()) {
            List<ObjectError> es = errors.getAllErrors();    //Member에 담아둔(DefaultMessage) 어노테이션과 message
            String msg = "";
            for (ObjectError e : es) {
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        MultipartFile mf = mate.getImgMate();   // 파일덩어리
        String new_imgname = mf.getOriginalFilename();   // 파일덩어리에서 이름을 꺼내온다
        if (new_imgname.equals("") || new_imgname == null) {   //이미지 지정이 따로 없으면, 기존 이미지를 그대로 쓰겠다
            mateService.modify(mate);
        } else {
            mate.setImg(new_imgname); // 아니면 (새 이미지를 지정했다면) img명을 넣고
            mateService.modify(mate);  // mate 전체 업데이트
            FileUploadUtil.saveFile(mf, imgdir); // 이미지 파일은 경로에 업로드
        }
        return "redirect:/mate/detail?id=" + mate.getId();
    }

    @RequestMapping("/deleteimpl")
    public String deleteimpl(Model model, Integer id) throws Exception {
        mateService.remove(id);
        return "redirect:/mate/all";
    }

    @RequestMapping("/findimpl")
    public String findimpl(Model model, Mate mate, @RequestParam(required = false, defaultValue = "1") int pageNo) throws Exception {
        log.info("===============NAME!!!!!"+mate.getSearch1());
        log.info("===============LICENSE!!!!!"+mate.getSearch2());
        log.info("===============AREA!!!!!"+mate.getSearch3());
        log.info("===============STARTPERIOD!!!!!"+mate.getStartPeriod());
        log.info("===============ENDPERIOD!!!!!"+mate.getEndPeriod());
        PageInfo<Mate> p = new PageInfo<>(mateService.getFindPage(pageNo, mate), 5);

        //mate 전체 리뷰리스트를 rlist로 addAttr
        List<MateReviewRate> rlist = mateReviewService.mateRateAll();
        model.addAttribute("rlist", rlist);

        model.addAttribute("value1",mate.getSearch1());
        model.addAttribute("value2",mate.getSearch2());
        model.addAttribute("value3",mate.getSearch3());
        model.addAttribute("value4",mate.getStartPeriod());
        model.addAttribute("value5",mate.getEndPeriod());
        model.addAttribute("target","mate");
        model.addAttribute("cpage",p);
        model.addAttribute("center",dir+"all");
        model.addAttribute("mate", mate);
        return "index";
    }
}
