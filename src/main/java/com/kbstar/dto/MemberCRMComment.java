package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MemberCRMComment {
    private Integer id;
    private Integer memberId;
    private String adminId;
    private Date rdate;
    private String crmComment;

    public MemberCRMComment(Integer memberId, String adminId, String crmComment) {
        this.memberId = memberId;
        this.adminId = adminId;
        this.crmComment = crmComment;
    }
}
