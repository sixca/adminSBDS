package com.kbstar.mapper;

import com.kbstar.dto.MateReviewComment;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MateReviewCommentMapper extends SBDSMapper<Integer, MateReviewComment> {
//    List<MateReviewComment> getMateReviewComment(Integer reviewId);
}
