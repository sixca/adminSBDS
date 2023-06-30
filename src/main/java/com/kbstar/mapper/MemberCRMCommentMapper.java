package com.kbstar.mapper;

import com.kbstar.dto.MemberCRMComment;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberCRMCommentMapper extends SBDSMapper<Integer, MemberCRMComment> {
}
