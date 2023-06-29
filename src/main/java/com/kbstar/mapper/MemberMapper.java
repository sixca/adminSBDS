package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Member;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberMapper extends SBDSMapper<Integer, Member> {
    Page<Member> getfindpage(Member member) throws Exception;

    void updateStatus(@Param("id") Integer id, @Param("valid") Integer valid);

}
