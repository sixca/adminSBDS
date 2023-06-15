package com.kbstar.mapper;

import com.kbstar.dto.Mate;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MateMapper extends SBDSMapper<Integer, Mate> {
}
