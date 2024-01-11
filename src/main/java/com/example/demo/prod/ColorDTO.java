package com.example.demo.prod;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ColorDTO {

  int no;
  String colorCode;
  String colorName;

}

// CREATE TABLE color(
// no INT AUTO_INCREAMENT PRIMARY KEY,
// colorCode VARCHAR(10)
// colorName VARCHAR(50)
// )
