package com.kbstar.mate;

import com.kbstar.service.MatchService;
import com.kbstar.service.MateReviewService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class ProgressBarTest {

	@Autowired
	MatchService service;

	@Autowired
	MateReviewService mateReviewService;

	@Test
	void contextLoads() {
		try {
			service.getMatchCntByMate(2000);
			service.getTotalPriceByMate(2000);
			mateReviewService.getReviewCntByMate(2000);
			mateReviewService.getAvgRateByMate(2000);
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
