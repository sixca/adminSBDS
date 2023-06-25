package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MateReviewComment {
    private Integer id;
    private Integer reviewId;
    private String adminId;
    private Date rdate;
    private String mateComment;
}
