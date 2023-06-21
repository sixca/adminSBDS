package com.kbstar.mate;

import com.kbstar.service.MateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class GetMatchedMemberImgAllTest {

	@Autowired
	MateService service;

	@Test
	void contextLoads() {
		try {
			service.getMatchedMemberImgAll();
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
