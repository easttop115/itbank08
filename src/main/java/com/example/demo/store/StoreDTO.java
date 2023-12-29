package com.example.demo.store;

import lombok.Getter;
import lombok.Setter;

/*
MariaDB
CREATE TABLE store (
    no INT PRIMARY KEY,
    storeNo VARCHAR(20) UNIQUE,
    name VARCHAR(20),
    address VARCHAR(50),
    tel VARCHAR(20)
);
*/
@Getter
@Setter
public class StoreDTO {
    private int no;
    private String storeNo;
    private String name;
    private String address;
    private String tel;

}
