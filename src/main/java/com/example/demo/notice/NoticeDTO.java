package com.example.demo.notice;

import lombok.Getter;
import lombok.Setter;

// CREATE TABLE notice (
//     id varchar(20) NOT NULL,
//     no INT(11) NOT NULL DEFAULT 0,
//     title VARCHAR(30) NOT NULL DEFAULT '',
//     content VARCHAR(300) NOT NULL DEFAULT '',  
//     writeDate VARCHAR(20) NOT NULL DEFAULT '',
//     fileName VARCHAR(255) NOT NULL DEFAULT '',
//     password VARCHAR(255) NOT NULL DEFAULT '',
//     views INT(11) NOT NULL DEFAULT 0,    조회수
//     isSticky VARCHAR(20) DEFAULT NULL,   상단고정
//     search_text VARCHAR(300) GENERATED ALWAYS AS (CONCAT('%', title, '%')) STORED,  검색
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
    private String password;
    private int views;
    private String isSticky;
    private String search_text;

}
