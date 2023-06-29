package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.MatchMonthGenderChart;
import com.kbstar.service.AdmService;
import com.kbstar.service.MatchMonthGenderChartService;
import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Random;

@Slf4j
@RestController
public class AjaxController {

    @Autowired
    AdmService admService;

    @Autowired
    MatchService matchService;

    @Autowired
    MatchMonthGenderChartService matchMonthGenderChartService;

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
    @RequestMapping("/getcntwaiting")
    public int getcntwaiting() throws Exception {
        return matchService.getCntWaiting();
    }
    @RequestMapping("/gettotalprice")
    public int gettotalprice() throws Exception {
        return matchService.getTotalPrice();
    }

    @RequestMapping("/getcancelledcnt")
    public int getcancelledcnt() throws Exception {
        return matchService.getCancelledCnt();
    }
    @RequestMapping("/getconfirmpercent")
    public int getconfirmpercent() throws Exception {
        return matchService.getConfirmPercent();
    }
    @RequestMapping("/getpaydonecnt")
    public int getpaydonecnt() throws Exception {
        return matchService.getPayDoneCnt();
    }

    //간병인 상세분석 차트
    @RequestMapping("/chart1")
    public Object chart1() throws Exception {
        try {
            List<MatchMonthGenderChart> list = matchMonthGenderChartService.getMonthlyGenderlyCnt();
            JSONArray fma = new JSONArray();
            JSONArray ma = new JSONArray();

            for (MatchMonthGenderChart c : list) {
                if (c.getGender().toUpperCase().equals("여성")) {
                    fma.add(c.getMatchCnt());
                } else {
                    ma.add(c.getMatchCnt());
                }
            }

            JSONObject fmo = new JSONObject();
            JSONObject mo = new JSONObject();

            // 여성 데이터 처리
            String[] fmaAgeGroups = {"40대 이하", "50대", "60대", "70대", "80대", "90대 이상"};
            for (int i = 0; i < fmaAgeGroups.length; i++) {
                if (i < fma.size()) {
                    fmo.put(fmaAgeGroups[i], fma.get(i));
                } else {
                    fmo.put(fmaAgeGroups[i], 0);
                }
            }

            // 남성 데이터 처리
            String[] maAgeGroups = {"40대 이하", "50대", "60대", "70대", "80대", "90대 이상"};
            for (int i = 0; i < maAgeGroups.length; i++) {
                if (i < ma.size()) {
                    mo.put(maAgeGroups[i], ma.get(i));
                } else {
                    mo.put(maAgeGroups[i], 0);
                }
            }

            // 결과 JSON 객체 생성
            JSONObject result = new JSONObject();
            result.put("남성", mo);
            result.put("여성", fmo);

            System.out.println(result.toJSONString());

            return result; // 수정: 결과를 반환하도록 추가
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // 수정: 예외 발생 시 null 반환
    }

    //Dash 차트1
//    @RequestMapping("/chart02")
//    public Object chart02() {
//        JSONArray ja = new JSONArray();
//        Random r = new Random();
//        for (int i = 0; i < 7; i++) {
//            int cnt = r.nextInt(40) + 1;
//            ja.add(cnt);
//        }
//        return ja;
//    }

    @RequestMapping("/chart02")
    public Object chart02() {
        JSONArray male = new JSONArray();
        JSONArray female = new JSONArray();
        Random r = new Random();
        for (int i = 0; i < 7; i++) {
            int maleCount = r.nextInt(40) + 1;
            int femaleCount = r.nextInt(40) + 1;
            male.add(maleCount);
            female.add(femaleCount);
        }

        JSONArray result = new JSONArray();
        result.add(male);
        result.add(female);

        return result;
    }

}



