package com.kbstar.mate;

import com.kbstar.dto.Mate;
import com.kbstar.service.MateService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

	@Autowired
	MateService service;

	@Test
	void contextLoads() {
		try {
			service.modify(new Mate(26,"updat@gmail.com","김업뎃스","김업뎃!", "서울시 서초구",6,"업뎃사","image4.jpg","N"));
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
