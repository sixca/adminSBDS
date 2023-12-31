package com.kbstar.mateReviewRate;

import com.kbstar.service.MateReviewService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class MateRateTest {

	@Autowired
	MateReviewService service;

	@Test
	void contextLoads() {
		try {
			service.mateRate(2005);
		} catch (Exception e) {
			log.info("평점조회 오류");
		}
	}
}
