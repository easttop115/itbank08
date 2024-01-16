package com.example.demo.join;

import lombok.Getter;
import lombok.Setter;

/* 
Maria DB
CREATE TABLE user (
    no INT AUTO_INCREMENT PRIMARY KEY,
    id VARCHAR(20) not null,
    pw VARCHAR(100) not null,
    company VARCHAR(50) not null,
    businessNo VARCHAR(20),
    email VARCHAR(40),
    regDate VARCHAR(20) not null,
    registStatus VARCHAR(20) not null,
    adCount VARCHAR(20),
    accountId VARCHAR(20),
    dbName VARCHAR(20)
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
    private String regDate;
    private String registStatus;
    private String adCount;
    private String accountId;
    private String dbName;
    private String count;
}
