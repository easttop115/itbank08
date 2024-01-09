package com.example.demo.prod;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CateDTO {

  int no;
  String cateGroup;
  String cateCode;
  String cateName;

}

// CREATE TABLE category(
// no INT AUTO_INCREAMENT PRIMARY KEY,
// cateGroup VARCHAR(10)
// cateCode VARCHAR(6)
// cateName VARCHAR(10)
// )