package com.example.demo.admin;

import lombok.Getter;
import lombok.Setter;

// create table admin (aId varchar(20) primary key, aPw varchar(60) not null);

@Getter
@Setter
public class AdminDTO {
    private String aId;
    private String aPw;
}
