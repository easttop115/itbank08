package com.example.demo.prod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProdService {

  @Autowired
  private ProdMapper mapper;

  public String insertProdProc(ProdDTO prods) {

    int result = mapper.insertProdProc(prods);
    if (result <= 0)
      return "상품등록 실패. 다시 시도해주세요";

    return "상품등록 성공";
  }
}
