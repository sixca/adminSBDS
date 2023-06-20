package com.kbstar.service;

import com.kbstar.dto.Match;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.MatchMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class MatchService implements SBDSService<Integer, Match> {

    @Autowired
    MatchMapper mapper;

    @Override
    public void register(Match match) throws Exception {
        mapper.insert(match);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Match match) throws Exception {
        mapper.update(match);
    }

    @Override
    public Match get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Match> get() throws Exception {
        return mapper.selectall();
    }

    public int getCntToMatched() throws Exception{
        return mapper.getCntToMatched();
    }

    public int getCntWaiting() throws Exception{
        return mapper.getCntWaiting();
    };


    public int getTotalPrice() throws Exception{
        return mapper.getTotalPrice();
    }

    public int getCancelledCnt() throws Exception{
        return mapper.getCancelledCnt();
    }

    public int getConfirmPercent() throws Exception{
        return mapper.getConfirmPercent();
    }

    public int getPayDoneCnt() throws Exception{
        return mapper.getPayDoneCnt();
    }


}
