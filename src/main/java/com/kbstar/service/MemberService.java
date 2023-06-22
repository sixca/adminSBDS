package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Member;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.MemberMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j   //로그사용
@Service
public class MemberService implements SBDSService<Integer, Member> {

    @Autowired
    MemberMapper mapper;

    @Override
    public void register(Member member) throws Exception {
        mapper.insert(member);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Member member) throws Exception {
        mapper.update(member);
    }

    @Override
    public Member get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Member> get() throws Exception {
        return mapper.selectall();
    }

    //회원관리 search & pagination
    public Page<Member> getFindPage(int pageNo, Member member) throws Exception{
        PageHelper.startPage(pageNo, 10);
        return mapper.getfindpage(member);
    }
}
