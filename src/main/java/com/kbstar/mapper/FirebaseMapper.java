package com.kbstar.mapper;

import com.kbstar.dto.FirebaseToken;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface FirebaseMapper {

    Optional<FirebaseToken> findByToken(String token);

    List<FirebaseToken> findAllTokens();
}
