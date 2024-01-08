package com.example.demo.prod;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service
@Transactional
public class ProdService {

  @Autowired
  private ProdMapper mapper;

  public String prodInsertProc(ProdDTO prods) {
    prods.setProdNo(generateProdNo(prods.getBrandCode(), prods.getCateGroup(), prods.getCateCode(), prods.getSize()));
    int result = mapper.prodInsertProc(prods);
    if (result <= 0) {
      return "상품등록 실패. 다시 시도해주세요";
    }
    return "상품등록 성공";
  }

  private String generateProdNo(String brandCode, String cateGroup, String cateCode, String size) {
    return brandCode + cateGroup + cateCode + size + UUID.randomUUID().toString();
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
