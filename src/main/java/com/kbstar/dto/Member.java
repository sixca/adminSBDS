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
public class Member {

    private Integer id;

    @Email(message = "올바른 이메일 형식이어야 합니다")
    @NotEmpty(message = "이메일은 필수 항목입니다")
    private String email;

    @NotEmpty(message = "NAME은 필수 항목 입니다")
    private String name;

    @Size(min=4, max=100, message="PWD는 최소4자리 수")
    private String password;
    private String birth;
    private String tel;
    private String addr;
    private String img;

//    @Pattern(regexp = "[NY]", message = "'N' 또는 'Y' 값을 입력하세요")
//    private String valid = "N";
    @Pattern(regexp = "[01]", message = "'0' 또는 '1' 값을 입력하세요")
    private String valid = "1";

    private MultipartFile imgMember; //추가 :: img(이미지 네임)를 파일 덩어리 자체로 변환하기 위함

    public Member(int id, String email, String name, String password, String birth, String tel, String addr, String img, String valid) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.password = password;
        this.birth = birth;
        this.tel = tel;
        this.addr = addr;
        this.img = img;
        this.valid = valid;
    } // 초기화

    //회원관리화면 조건검색 시 사용 변수
    private String keyword1;
    private String search1;
    private String keyword2;
    private String search2;
    private String keyword3;
    private String startDate;
    private String keyword4;
    private String endDate;
}

