package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MateReviewRate {
    private Integer mateId;
    private float rate;
}
