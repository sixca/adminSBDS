package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Coupon;
import com.kbstar.dto.Search;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CouponMapper extends SBDSMapper<Integer, Coupon> {
    Page<Coupon> getfindpage(Search search) throws Exception;
}
