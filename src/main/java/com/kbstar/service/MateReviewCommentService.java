package com.kbstar.service;

import com.kbstar.dto.MateReviewComment;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.MateReviewCommentMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MateReviewCommentService implements SBDSService<Integer, MateReviewComment> {

    @Autowired
    MateReviewCommentMapper mapper;
//
//    public List<MateReviewComment> getMateReviewComment(Integer reviewId){
//        return mapper.getMateReviewComment(reviewId);
//    }

    @Override
    public void register(MateReviewComment mateReviewComment) throws Exception {
        mapper.insert(mateReviewComment);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(MateReviewComment mateReviewComment) throws Exception {
        mapper.update(mateReviewComment);
    }

    @Override
    public MateReviewComment get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<MateReviewComment> get() throws Exception {
        return mapper.selectall();
    }
}
