package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ItemReview {
    private Integer id;
    private Integer memberId;
    private Integer itemId;
    private String title;
    private String review;
    private Integer rate;
}
