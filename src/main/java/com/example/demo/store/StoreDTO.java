package com.example.demo.store;

import lombok.Getter;
import lombok.Setter;

/*
MariaDB
CREATE TABLE store (
  no int(11) NOT NULL,
  storeNo varchar(20) DEFAULT NULL,
  name varchar(20) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  tel varchar(20) DEFAULT NULL,
  PRIMARY KEY (no),
  UNIQUE KEY storeNo (storeNo)
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
