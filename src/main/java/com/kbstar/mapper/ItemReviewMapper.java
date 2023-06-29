package com.kbstar.mapper;

import com.kbstar.dto.ItemReviewDto;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ItemReviewMapper extends SBDSMapper<Integer, ItemReviewDto> {
}
