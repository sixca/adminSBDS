package com.kbstar.item;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {

	@Autowired
	ItemService service;

	@Test
	void contextLoads() {
		Item obj = new Item(1,"테스트제품","product-4.jpg",65000,"M","Black","1");
		try {
			service.register(obj);
			log.info("등록 정상..");
		} catch (Exception e) {
			if(e instanceof DuplicateKeyException){
				log.info("오류----");
			}else{
				log.info("시스템 장애입니다-----------------------");
				e.printStackTrace();  //에러를 자세히 보려면 요렇게
			}
		}
	}
}
