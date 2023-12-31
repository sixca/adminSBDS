package com.kbstar.mapper;

import com.kbstar.dto.MatchMonthGenderChart;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MatchMonthGenderChartMapper {
    List<MatchMonthGenderChart> getMonthlyGenderlyCnt();
}
