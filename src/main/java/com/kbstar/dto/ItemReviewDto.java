package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ItemReviewDto {
    private int id;
    private String reviewName;
    private String review;
    private String title;
    private String itemName;
    private int rate;
}
