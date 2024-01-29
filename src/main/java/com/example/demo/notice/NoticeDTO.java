package com.example.demo.notice;

import lombok.Getter;
import lombok.Setter;

// CREATE TABLE notice (
//     id VARCHAR(20) NOT NULL,
//     no INT(11) NOT NULL DEFAULT 0,
//     title VARCHAR(30) NOT NULL DEFAULT '',
//     content VARCHAR(300) DEFAULT NULL,
//     writeDate VARCHAR(20) NOT NULL DEFAULT '',
//     fileName VARCHAR(255) NOT NULL DEFAULT '',
//     views INT(11) NOT NULL DEFAULT 0,
//     checked TINYINT(1) DEFAULT NULL,  //확인
//     PRIMARY KEY (no)
// );

@Setter
@Getter
public class NoticeDTO {
    private String id;
    private int no;
    private String title;
    private String content;
    private String writeDate;
    private String fileName;
    private int views;
    private String checked;

}
