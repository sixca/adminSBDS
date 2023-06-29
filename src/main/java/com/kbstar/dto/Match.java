package com.kbstar.dto;

import lombok.*;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Match {
    private int id;
    private int memberId;
    private int mateId;
    private String startDate;
    private String endDate;
    private String service;
    private String area;
    private String objectGender;
    private String objectBirth;
    private String status;
    private int price;
    private String payment;
    private Date payDate;

    private String mateName;
    private String memberName;

    //매칭관리화면 조건검색 시 사용 변수
    private String keyword1;
    private String search1;
    private String keyword2;
    private String search2;
    private String keyword3;
    private String startDateTo;
    private String keyword4;
    private String startDateFrom;
}