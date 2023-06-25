package com.kbstar.mate;

import com.kbstar.service.MateReviewService;
import com.kbstar.service.MateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class ReviewTest {

	@Autowired
	MateService service;
	@Autowired
	MateReviewService mateReviewService;

	@Test
	void contextLoads() {
		try {
//			mateReviewService.getByMateId(2021);
			mateReviewService.get();

		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
