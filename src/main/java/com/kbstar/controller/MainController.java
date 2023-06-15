package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
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

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class MainController {

    @Autowired
    AdmService admService;

    @Autowired
    private BCryptPasswordEncoder encoder;  //암호화

    @Value("${adminserver}")
    String adminserver;

    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("adminserver", adminserver);
        return "index";
    }
    @RequestMapping("/marketing")
    public String marketing(Model model){
        model.addAttribute("center","marketing");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model, String redirectURL){
        model.addAttribute("redirectURL",redirectURL);
//        model.addAttribute("center", "login");
        return "login";
    }

    @RequestMapping("/logout")
    public String logout(Model model, HttpSession session){
        if(session != null){             //로긴 상태면
            session.invalidate();        //세션에서 정보를 없애라
        }
        return "redirect:/";
//        return "index";
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String adminId, String pwd, String redirectURL
            ,HttpSession session) throws Exception {      //로그인 성공 시 session에다가 넣어둔다
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm = admService.get(adminId);
            if (adm != null && encoder.matches(pwd, adm.getPwd())) {    //id가 있고, 해당하는 아이디의 pwd를 비교 후 일치하면
                nextPage = "loginok";
                session.setMaxInactiveInterval(1000);  //세션 유지 시간 설정 :: 1000초 지나면 세션 종료(로긴 튕김)
                session.setAttribute("loginadm", adm);//쎄션에 로긴정보를 박아두는 것  .. index에도 나오는 loginadm
                if (redirectURL == null || redirectURL.equals("")) {
                    return "redirect:/";
                } else {
                    return "redirect:" + redirectURL;
                }
            }
        } catch(Exception e){
            throw new Exception("ID, PW 확인하세요. 다시 로그인 하세요");
        }
//        model.addAttribute("radm", adm);
        model.addAttribute("center", nextPage);
        return "index";
    }

    @RequestMapping("/auth-forgot-password-basic")
    public String login(Model model){
        return "auth-forgot-password-basic";
    }

    @RequestMapping("/register")
    public String register(Model model){
//        model.addAttribute("center", "register");
        return "register";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, @Validated Adm adm, Errors errors
            ,HttpSession session) throws Exception {
        if(errors.hasErrors()){
            List<ObjectError> es = errors.getAllErrors();    //Adm에 담아둔 유효성검사 구현
            String msg ="";
            for(ObjectError e:es){
                msg += "<h4>";
                msg += e.getDefaultMessage();
                msg += "</h4>";
            }
            throw new Exception(msg);
        }
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));  //화면에서 입력한 pwd를 가져와서 암호화 한 다음에 다시 adm 객체에 넣어서 register
            admService.register(adm);
            session.setAttribute("loginadm", adm);   //회원가입 시 바로 로그인 처리 되도록하기
        } catch (Exception e) {
            log.error("======================An error occurred: " + e.getMessage(), e);
            throw new Exception("가입오류");
        }
        return "redirect:/";
    }

}
