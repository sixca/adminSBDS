package com.kbstar.service;

import com.kbstar.dto.ItemReview;
import com.kbstar.dto.ItemReviewDto;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.ItemReviewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ItemReviewService implements SBDSService<Integer, ItemReviewDto> {

    @Autowired
    ItemReviewMapper mapper;

    @Override
    public void register(ItemReviewDto itemReview) throws Exception {
        mapper.insert(itemReview);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(ItemReviewDto itemReviewDto) throws Exception {

    }

    @Override
    public ItemReviewDto get(Integer integer) throws Exception {
        return null;
    }


    @Override
    public List<ItemReviewDto> get() throws Exception {
        return mapper.selectall();
    }
}
