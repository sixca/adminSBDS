package com.kbstar.service;

import com.kbstar.dto.Item;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.ItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ItemService implements SBDSService<Integer, Item> {


    @Autowired
    ItemMapper mapper;

    @Override
    public void register(Item item) throws Exception {
        mapper.insert(item);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Item item) throws Exception {
        mapper.update(item);
    }

    @Override
    public Item get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }
}
