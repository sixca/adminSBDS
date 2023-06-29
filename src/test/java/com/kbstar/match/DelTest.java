package com.kbstar.match;

import com.kbstar.service.ItemReviewService;
import com.kbstar.service.ItemService;
import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DelTest {

	@Autowired
	MatchService service;

	@Autowired
	ItemReviewService itemReviewService;

	@Autowired
	ItemService itemService;

	@Test
	void contextLoads() {
		try {
//		  service.get();
			itemReviewService.remove(20);
		} catch (Exception e) {
			log.info("에러..");
			e.printStackTrace();
		}
	}
}

