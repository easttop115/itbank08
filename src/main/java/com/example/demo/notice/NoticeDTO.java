package com.example.demo.notice;

import lombok.Getter;
import lombok.Setter;

// CREATE TABLE notice (
//   no INT(11) NOT NULL DEFAULT 0,
//   title VARCHAR(30) NOT NULL DEFAULT '',
//   content VARCHAR(300) NOT NULL DEFAULT '',
//   writeDate VARCHAR(20) NOT NULL DEFAULT '',
//   fileName VARCHAR(255) NOT NULL DEFAULT '',
//   password VARCHAR(255) NOT NULL DEFAULT '',
//   views INT(11) NOT NULL DEFAULT 0,
//   isSticky VARCHAR(20) DEFAULT NULL,
//   PRIMARY KEY (no)
// );

@Setter
@Getter
public class NoticeDTO {
    private int no;
    private String title;
    private String content;
    private String writeDate;
    private String fileName;
    private String password;
    private int views;
    private String isSticky;

}
