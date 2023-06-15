package com.kbstar.mapper;

import com.kbstar.dto.Adm;
import com.kbstar.frame.SBDSMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdmMapper extends SBDSMapper<String, Adm> {

}
