package com.kbstar.service;

import com.kbstar.dto.MatchMonthGenderChart;
import com.kbstar.mapper.MatchMonthGenderChartMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MatchMonthGenderChartService {

    @Autowired
    MatchMonthGenderChartMapper mapper;

    public List<MatchMonthGenderChart> getMonthlyGenderlyCnt() throws Exception {
        return mapper.getMonthlyGenderlyCnt();
    }

}
