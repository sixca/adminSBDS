package com.kbstar.adm;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class CheckIdTest {

	@Autowired
	AdmService service;

	@Test
	void contextLoads() throws Exception {
			int result = 0;
			Adm adm = null;
			adm = service.get("ad0614");
			if(adm != null){
				result=1;
			}
		log.info("===============Result: {}", result);
	}
}

