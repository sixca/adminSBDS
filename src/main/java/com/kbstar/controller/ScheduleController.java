package com.kbstar.controller;

import com.kbstar.dto.MsgDash;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;


@Slf4j
@Component
public class ScheduleController {
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

    @Scheduled(cron = "*/5 * * * * *")
    public void cronJobDailyUpdate() {
        Random r = new Random();
        int content1 = r.nextInt(30)+1;
        int content2 = r.nextInt(120)+1;
        int content3 = r.nextInt(30)+1;
        int content4 = r.nextInt(60)+1;
        int content5 = r.nextInt(80)+1;

        MsgDash msg = new MsgDash();
        msg.setContent1(content1);
        msg.setContent2(content2);
        msg.setContent3(content3);
        msg.setContent4(content4);
        msg.setContent5(content5);
        messagingTemplate.convertAndSend("/sendadm", msg);
    }
}
//
//    초 분 시 일 월 요일
//cron = "*  *  *  *  *  *"
//
//        0 0 * * * * : 매 시 0분 0초에 작업
//        */15 * * * * * : 매 15초마다 작업
//        0 0 0 1,8,17,26 * * : 매달 1, 8, 17, 26일 자정에 작업
//        0 0 10-20 * * * : 매일 10시 ~ 20시 한시간 간격으로 작업
//        0 0 9-18 * * 1-5 : 월 ~ 금(평일) 9 ~ 18시 매 정각에 작업
//        0 0 */3 4 * * : 매달 4일에 3시간 간격으로 작업