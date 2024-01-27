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
  String colorCode;
  int quan;
  String prodCon;
  String regDate; // mapper -> Now()
  String storeName;

  public ProdDTO(String brandCode, String cateGroup, String cateCode, String size) {
    // 생성자에서 직접 getProdNo 메서드 호출
    getProdNo(brandCode, cateGroup, cateCode, size);
  }

  // prodNo를 자동으로 생성하는 메서드
  private void getProdNo(String brandCode, String cateGroup, String cateCode, String size) {
    this.prodNo = brandCode + cateGroup + cateCode + size + UUID.randomUUID().toString();
  }

  // CREATE TABLE product(
  // no INT AUTO_INCREAMENT PRIMARY KEY,
  // prodNo VARCHAR(200) DEFAULT CONCAT('cateCode', UUID()),
  // brandCode VARCHAR(25),
  // cateCode VARCHAR(25),
  // prodName VARCHAR(50),
  // incomePrice INT,
  // sellPrice INT,
  // size VARCHAR(6)
  // colorCode VARCHAR(10),
  // quan INT,
  // regDat VARCHAR(50),
  // prodCon VARCHAR(300),
  // storeName VARCHAR(20)
  // )

}
