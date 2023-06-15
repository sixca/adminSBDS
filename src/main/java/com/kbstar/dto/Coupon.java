package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Coupon {
    private Integer id;
    private Integer memberId;
    private Integer num;
    private Integer amount;
    private String admComment;
}
