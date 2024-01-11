package com.example.demo.prod;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProdService {

  @Autowired
  private ProdMapper mapper;

  public String addBrand(String brandCode, String brandDescription) {
    int result = mapper.addBrand(brandCode, brandDescription);
    if (result <= 0) {
      return "fail";
    }
    return "success";
  }

  public String addCategory(String cateGroup, String cateCode, String cateName) {
    int result = mapper.addCategory(cateGroup, cateCode, cateName);
    if (result <= 0) {
      return "fail";
    }
    return "success";
  }

  public String addColor(String colorCode, String colorName) {
    int result = mapper.addColor(colorCode, colorName);
    if (result <= 0) {
      return "fail";
    }
    return "success";
  }

  public String prodInsertProc(ProdDTO prods) {

    int result = mapper.prodInsertProc(prods);
    if (result <= 0) {
      return "상품등록 실패. 다시 시도해주세요";
    }
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

  // public List<ProdDTO> prodList(ProdDTO prod, String prodNo, String cateGroup,
  // String cateCode, String colorCode,
  // String size) {
  // return mapper.selectProdNo(prod, prodNo, cateGroup, cateCode, colorCode,
  // size);
  // }

  public List<ProdDTO> prodList(Map<String, String> params) {
    return mapper.prodList(params);
  }

}