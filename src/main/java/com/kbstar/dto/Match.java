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
}