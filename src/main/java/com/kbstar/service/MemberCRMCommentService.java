package com.kbstar.service;

import com.kbstar.dto.MateReviewComment;
import com.kbstar.dto.MemberCRMComment;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.MemberCRMCommentMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MemberCRMCommentService implements SBDSService<Integer, MemberCRMComment> {

    @Autowired
    MemberCRMCommentMapper mapper;

    @Override
    public void register(MemberCRMComment memberCRMComment) throws Exception {
        mapper.insert(memberCRMComment);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(MemberCRMComment memberCRMComment) throws Exception {
        mapper.update(memberCRMComment);
    }

    @Override
    public MemberCRMComment get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<MemberCRMComment> get() throws Exception {
        return mapper.selectall();
    }
}
