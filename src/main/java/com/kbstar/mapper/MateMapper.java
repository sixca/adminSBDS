package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Mate;
import com.kbstar.dto.Member;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MateMapper extends SBDSMapper<Integer, Mate> {

    public List<Mate> getTOP10List() throws Exception;

    public List<Mate> getMatchedMemberImgAll() throws Exception;

    Page<Mate> getfindpage(Mate mate) throws Exception;
}
