package com.example.demo.prod;

import lombok.Getter;
import lombok.Setter;
import java.util.UUID;

@Getter
@Setter
public class ProdDTO {

  int no;
  String prodNo;
  String brandCode;
  String cateGroup;
  String cateCode;
  String prodName;
  int incomePrice; // 입고가격
  int sellPrice; // 판매가격
  String size;
  String color;
  int quan;
  String prodCon;
  String regDate; // mapper -> Now()

  public void setProdNo(String brandCode, String cateGroup, String cateCode, String size) {
    this.brandCode = brandCode;
    this.cateGroup = cateGroup;
    this.cateCode = cateCode;
    this.size = size;
    this.prodNo = brandCode + cateGroup + cateCode + size + UUID.randomUUID().toString();
  }

}
