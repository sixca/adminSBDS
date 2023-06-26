package com.kbstar.matereview;

import com.kbstar.service.MateReviewCommentService;
import com.kbstar.service.MateReviewService;
import com.kbstar.service.MateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetAllTest {

	@Autowired
	MateService service;
	@Autowired
	MateReviewService mateReviewService;
	@Autowired
	MateReviewCommentService mateReviewCommentService;

	@Test
	void contextLoads() {
		try {
//			mateReviewService.getByMateId(2021);
//			mateReviewService.get(1);
//			mateReviewService.get();
			mateReviewCommentService.get();
//			mateReviewCommentService.remove(21);

		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
