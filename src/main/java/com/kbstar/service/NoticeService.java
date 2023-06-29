package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Item;
import com.kbstar.dto.MateReview;
import com.kbstar.dto.Notice;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.NoticeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class NoticeService implements SBDSService<Integer, Notice> {

    @Autowired
    NoticeMapper mapper;

    @Override
    public void register(Notice notice) throws Exception {
        mapper.insert(notice);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Notice notice) throws Exception {
        mapper.update(notice);
    }

    @Override
    public Notice get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Notice> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Notice> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 10); // 한화면에 출력되는 열 갯수
        return mapper.getpage();
    }

    public List<Notice> search(Notice ns) throws Exception{
        return mapper.search(ns);
    }

}
