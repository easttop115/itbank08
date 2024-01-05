package com.example.demo.mail;

public class SubAccountDTO {
    private String subAccountId;
    private String ePw;

    public SubAccountDTO(String subAccountId, String ePw) {
        this.subAccountId = subAccountId;
        this.ePw = ePw;
    }

    public String getSubAccountId() {
        return subAccountId;
    }

    public String getEPw() {
        return ePw;
    }
}
