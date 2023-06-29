package com.kbstar.mapper;

import com.github.pagehelper.Page;
import com.kbstar.dto.Item;
import com.kbstar.dto.Notice;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface NoticeMapper extends SBDSMapper<Integer, Notice> {
    Page<Notice> getpage() throws Exception;

    public List<Notice> search(Notice ns);

    void updateStatus(@Param("id") Integer id, @Param("status") Integer status);


}
