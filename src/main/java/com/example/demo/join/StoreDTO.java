package com.example.demo.join;

import lombok.Getter;
import lombok.Setter;

/*
CREATE TABLE store (
  no int(11) NOT NULL AUTO_INCREMENT,
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
