package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MatchMonthGenderChart {
    private String gender;
    private String age;
    private Integer matchCnt;
}
