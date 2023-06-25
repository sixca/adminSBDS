package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MateReview {
    private Integer id;
    private Integer mateId;
    private Integer memberId;
    private Integer rate;
    private String content;
    private Date rdate;

    private String mateName;
    private String memberName;
}
