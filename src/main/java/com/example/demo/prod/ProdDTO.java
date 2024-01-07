package com.example.demo.prod;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProdDTO {

  int no;
  String prodNo;
  String brandCode;
  String cateCode;
  String prodName;
  int incomePrice; // 입고가격
  int sellPrice; // 판매가격
  String size;
  String color;
  int quan;
  String prodCon;
  String regDate; // mapper -> Now()

  public ProdDTO(String brandCode, String cateCode, String size, String color) {
    this.brandCode = brandCode;
    this.size = size;
    this.color = color;
    this.prodNo = brandCode + size + color + System.currentTimeMillis();
  }

}
