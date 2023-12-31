package com.kbstar.controller;

import com.kbstar.dto.FCMNotificationRequestDto;
import com.kbstar.service.FCMNotificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
public class PushController {
    private final FCMNotificationService fcmNotificationService;

    // 마케팅 Push
    @PostMapping("/notification")
    public String sendNotificationByToken(FCMNotificationRequestDto requestDto) {
        fcmNotificationService.sendNotificationByToken(requestDto);
        return "redirect:/";
    }
}
