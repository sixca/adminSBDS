package com.kbstar.dto;

import lombok.*;

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
    private String img;
}
