package com.example.demo.prod;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ProdService {

  @Autowired
  private ProdMapper mapper;

  public String prodInsertProc(ProdDTO prods) {

    int result = mapper.prodInsertProc(prods);
    if (result <= 0)
      return "상품등록 실패. 다시 시도해주세요";

    return "상품등록 성공";
  }

  // public String prodList(Model model) {

  public List<ProdDTO> prodList(String categoryCode, String brandCode, String color, String size) {
    Map<String, String> paramMap = new HashMap<>();
    paramMap.put("categoryCode", "desiredCategoryCode");
    paramMap.put("brandCode", "desiredBrandCode");
    paramMap.put("color", "desiredColor");
    paramMap.put("size", "desiredSize");

    List<ProdDTO> list = mapper.prodList(paramMap);

    return list;
  }

}
