package com.kbstar.mapper;

import com.kbstar.dto.Notice;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NoticeMapper extends SBDSMapper<Integer, Notice> {
}
