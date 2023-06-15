package com.kbstar.service;

import com.kbstar.dto.Mate;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.MateMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j   //로그사용
@Service
public class MateService implements SBDSService<Integer, Mate> {

    @Autowired
    MateMapper mapper;

    @Override
    public void register(Mate mate) throws Exception {
        mapper.insert(mate);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Mate mate) throws Exception {
        mapper.update(mate);
    }

    @Override
    public Mate get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Mate> get() throws Exception {
        return mapper.selectall();
    }
}
