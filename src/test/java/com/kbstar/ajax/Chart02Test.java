package com.kbstar.ajax;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Random;

@Slf4j
@SpringBootTest
class Chart02Test {

	@Test
	void contextLoads() {
		try {
			JSONArray male = new JSONArray();
			JSONArray female = new JSONArray();
			Random r = new Random();
			for (int i = 0; i < 7; i++) {
				int maleCount = r.nextInt(40) + 1;
				int femaleCount = r.nextInt(40) + 1;
				male.add(maleCount);
				female.add(femaleCount);
			}

			JSONArray result = new JSONArray();
			result.add(male);
			result.add(female);

			System.out.println(result.toJSONString());
		} catch (Exception e) {
			log.info("오류");
			e.printStackTrace();
		}
	}
}
