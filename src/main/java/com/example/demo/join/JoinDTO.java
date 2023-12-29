package com.example.demo.join;

import lombok.Getter;
import lombok.Setter;

/* 
Maria DB
CREATE TABLE user (
    no INT PRIMARY KEY,
    id VARCHAR(20),
    pw VARCHAR(100),
    company VARCHAR(50),
    businessNo VARCHAR(20),
    email VARCHAR(40),
    tel VARCHAR(20),
    regDate VARCHAR(20)
);
*/
@Getter
@Setter
public class JoinDTO {

    private int no;
    private String id;
    private String pw;
    private String confirm;
    private String company;
    private String businessNo;
    private String email;
    private String tel;
    private String regDate;

}
