package com.example.demo.admin;

import lombok.Getter;
import lombok.Setter;

// create table admin (aId varchar(20) primary key, aPw varchar(60) not null);

// 관리자 로그인 페이지     http://localhost/suadonghyunyeonjidongwoonsangwon@SC

@Getter
@Setter
public class AdminDTO {
    private String aId;
    private String aPw;
    private String confirm;
}
