package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Match;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MatchMapper extends SBDSMapper<Integer, Match> {
    int getCntToMatched();
    int getCntWaiting();

    int getTotalPrice();

    int getCancelledCnt();

    int getConfirmPercent();

    int getPayDoneCnt();

    int getMatchCntByMate(int id);
    int getTotalPriceByMate(int id);

    // all pagination
    Page<Match> getfindpage(Match match) throws Exception;

    // status 변경 기능
    void updateStatus(@Param("id") Integer id, @Param("status") String status);

}
