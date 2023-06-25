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
class MateReviewCommentTest {

	@Autowired
	MateReviewCommentService mateReviewCommentService;

	@Test
	void contextLoads() {
		try {
//			mateReviewCommentService.getMateReviewComment(1);
			mateReviewCommentService.get(2);
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
