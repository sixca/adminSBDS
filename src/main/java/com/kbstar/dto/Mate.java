package com.kbstar.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

// 롬복
// 생성자, 겟터/세터, 투스트링 선언 생략.
// ANNOTATION방식으로 Cust를 활용하도록 해줌.
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Mate {

    private Integer id;

    @Email(message = "올바른 이메일 형식이어야 합니다")
    @NotEmpty(message = "이메일은 필수 항목입니다")
    private String email;

    @NotEmpty(message = "NAME은 필수 항목 입니다")
    private String name;

    @Size(min=4, max=100, message="PWD는 최소4자리 수")
//    @Pattern(regexp ="^(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$",
//            message = "Password는 특수문자를 포함한 8자리 이상이어야 합니다")
    private String password;
    private String area;
    private Integer jobPeriod;
    private String license;
    private String img;

    @Pattern(regexp = "[NY]", message = "'N' 또는 'Y' 값을 입력하세요")
    private String valid = "N";

    private MultipartFile imgMate; //추가 :: img(이미지 네임)를 파일 덩어리 자체로 변환하기 위함

    public Mate(Integer id, String email, String name, String password, String area, Integer jobPeriod, String license, String img, String valid) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
        this.area = area;
        this.jobPeriod = jobPeriod;
        this.license = license;
        this.img = img;
        this.valid = valid;
    }
}

