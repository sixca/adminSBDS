package com.kbstar.analysis;

import com.kbstar.service.MatchService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetCancelledCntTest {

	@Autowired
	MatchService service;

	@Test
	void contextLoads() {
		try {
			service.getCancelledCnt();
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
