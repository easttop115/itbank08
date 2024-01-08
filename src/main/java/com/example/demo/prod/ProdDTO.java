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

  public ProdDTO(String brandCode, String cateGroup, String cateCode, String size) {
    // 생성자에서 직접 getProdNo 메서드 호출
    getProdNo(brandCode, cateGroup, cateCode, size);
  }

  // prodNo를 자동으로 생성하는 메서드
  private void getProdNo(String brandCode, String cateGroup, String cateCode, String size) {
    this.brandCode = brandCode;
    this.cateGroup = cateGroup;
    this.cateCode = cateCode;
    this.size = size;
    this.prodNo = brandCode + cateGroup + cateCode + size + UUID.randomUUID().toString();
  }

}
