package com.kbstar.service;

import com.kbstar.dto.ItemReview;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.ItemReviewMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ItemReviewService implements SBDSService<Integer, ItemReview> {

    @Autowired
    ItemReviewMapper mapper;

    @Override
    public void register(ItemReview itemReview) throws Exception {
        mapper.insert(itemReview);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(ItemReview itemReview) throws Exception {
        mapper.update(itemReview);
    }

    @Override
    public ItemReview get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<ItemReview> get() throws Exception {
        return mapper.selectall();
    }
}
