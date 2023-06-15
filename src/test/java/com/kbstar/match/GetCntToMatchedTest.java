package com.kbstar.match;

import com.kbstar.dto.Mate;
import com.kbstar.service.MatchService;
import com.kbstar.service.MateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetCntToMatchedTest {

	@Autowired
	MatchService service;

	@Test
	void contextLoads() {
		try {
			service.getCntToMatched();
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
