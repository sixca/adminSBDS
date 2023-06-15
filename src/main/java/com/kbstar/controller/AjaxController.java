package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class AjaxController {

    @Autowired
    AdmService admService;

    @Autowired
    MatchService matchService;

    @GetMapping("/checkid")   //GET요청에 대해서만 처리
    public Object checkid(@RequestParam String adminId) throws Exception {
        int result = 0;
        Adm adm = null;
        adm = admService.get(adminId);
        if (adm != null) {
            result = 1;
        }
        if (adminId.length() > 10) {
            result = 2;
        }
        return result;
    }

    @RequestMapping("/getcnttomatched")
    public int getcnttomatched() throws Exception {
        return matchService.getCntToMatched();
    }
}
