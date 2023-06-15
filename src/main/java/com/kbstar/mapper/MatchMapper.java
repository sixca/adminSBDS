package com.kbstar.mapper;

import com.kbstar.dto.Match;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MatchMapper extends SBDSMapper<Integer, Match> {
    int getCntToMatched();
}
