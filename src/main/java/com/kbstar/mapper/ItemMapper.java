package com.kbstar.mapper;

import com.kbstar.dto.Item;
import com.kbstar.dto.MateReview;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemMapper extends SBDSMapper<Integer, Item> {
}
