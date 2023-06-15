package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Item {
    private Integer id;
    private Integer registerId;
    private String name;
    private String img;
    private int price;
    private String itemSize;
    private String color;
    private Date rdate;
    private Date udate;
    private String isValid;

    private MultipartFile imgName;

    public Item(Integer registerId, String name, String img, int price, String itemSize, String color, String isValid) {
        this.registerId = registerId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.itemSize = itemSize;
        this.color = color;
        this.isValid = isValid;
    }
}