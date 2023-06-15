package com.kbstar.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.kbstar.dto.Coupon;
import com.kbstar.dto.Search;
import com.kbstar.frame.SBDSService;
import com.kbstar.mapper.CouponMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class CouponService implements SBDSService<Integer, Coupon> {

    @Autowired
    CouponMapper mapper;

    @Override
    public void register(Coupon coupon) throws Exception {
        mapper.insert(coupon);
    }

    @Override
    public void remove(Integer id) throws Exception {
        mapper.delete(id);
    }

    @Override
    public void modify(Coupon coupon) throws Exception {
        mapper.update(coupon);
    }

    @Override
    public Coupon get(Integer id) throws Exception {
        return mapper.select(id);
    }

    @Override
    public List<Coupon> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Coupon> getFindPage(int pageNo, Search search) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return mapper.getfindpage(search);
    }
}
