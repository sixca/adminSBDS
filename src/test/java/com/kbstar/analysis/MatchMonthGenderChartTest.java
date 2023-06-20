package com.kbstar.analysis;

import com.kbstar.dto.MatchMonthGenderChart;
import com.kbstar.service.MatchMonthGenderChartService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class MatchMonthGenderChartTest {

	@Autowired
	MatchMonthGenderChartService service;

	@Test
	void contextLoads() {
//		try {
//			service.getMonthlyGenderlyCnt();
//		} catch (Exception e) {
//			log.info("평점조회 오류");
//		}

		// 남성:[{},{},{},...],여성:[{},{},{},...]
			try {
				List<MatchMonthGenderChart> list = service.getMonthlyGenderlyCnt();
				JSONArray fma = new JSONArray();
				JSONArray ma = new JSONArray();

				for (MatchMonthGenderChart c : list) {
					if (c.getGender().toUpperCase().equals("여성")) {
						fma.add(c.getMatchCnt());
					} else {
						ma.add(c.getMatchCnt());
					}
				}

				JSONObject fmo = new JSONObject();
				JSONObject mo = new JSONObject();

				// 여성 데이터 처리
				String[] fmaAgeGroups = {"40대 이하", "50대", "60대", "70대", "80대", "90대 이상"};
				for (int i = 0; i < fmaAgeGroups.length; i++) {
					if (i < fma.size()) {
						fmo.put(fmaAgeGroups[i], fma.get(i));
					} else {
						fmo.put(fmaAgeGroups[i], 0);
					}
				}

				// 남성 데이터 처리
				String[] maAgeGroups = {"40대 이하", "50대", "60대", "70대", "80대", "90대 이상"};
				for (int i = 0; i < maAgeGroups.length; i++) {
					if (i < ma.size()) {
						mo.put(maAgeGroups[i], ma.get(i));
					} else {
						mo.put(maAgeGroups[i], 0);
					}
				}

				// 결과 JSON 객체 생성
				JSONObject result = new JSONObject();
				result.put("남성", mo);
				result.put("여성", fmo);

				System.out.println(result.toJSONString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

