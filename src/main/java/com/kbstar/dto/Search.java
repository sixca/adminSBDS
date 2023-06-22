package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Search {
    private String keyword1;
    private String search1;
    private String keyword2;
    private String search2;
    private String keyword3;
    private String search3;
}
//쿠폰 관리 화면의 조건검색