package com.example.demo.prod;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ProdService {

  @Autowired
  private ProdMapper mapper;

  public String prodInsertProc(ProdDTO prod, BrandDTO brands, ColorDTO colors) {

    System.out.println("prodNo : " + prod.getProdNo());

    int result = mapper.prodInsertProc(prod, brands, colors);
    if (result <= 0)
      return "상품등록 실패. 다시 시도해주세요";

    return "상품등록 성공";
  }

  public List<CateDTO> cateGroupList() {

    List<CateDTO> cates = mapper.cateGroupList();

    return cates;
  }

  public List<CateDTO> cateCodeList() {

    List<CateDTO> cates = mapper.cateCodeList();

    return cates;
  }

  public List<BrandDTO> brandCodeList() {

    List<BrandDTO> brands = mapper.brandCodeList();

    return brands;
  }

  public List<ColorDTO> colorCodeList() {

    List<ColorDTO> colors = mapper.colorCodeList();

    return colors;
  }

  public List<ProdDTO> prodList(String cateCode, String brandCode, String color, String size) {
    Map<String, String> paramMap = new HashMap<>();
    paramMap.put("cateCode", cateCode);
    paramMap.put("brandCode", brandCode);
    paramMap.put("color", color);
    paramMap.put("size", size);

    List<ProdDTO> list = mapper.prodList(paramMap);

    return list;
  }

}
