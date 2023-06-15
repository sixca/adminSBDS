package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Adm {
    private Integer id;

    @NotEmpty(message = "ID는 필수 항목입니다")
    @Size(min=4, max=10, message="ID는 최소 4자리 최대 10자리 입니다.")
    private String adminId;

    @NotEmpty(message = "Password는 필수 항목입니다")
    @Pattern(regexp ="^(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$",
            message = "Password는 특수문자를 포함한 8자리 이상이어야 합니다")
    private String pwd;
}
