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

  public List<ProdDTO> prodList(String prod) {

    return mapper.selectProdNo(prod);
  }

  private boolean isSelectEmpty(ProdDTO prod) {
    return prod == null || (prod.getProdNo() == null || prod.getProdNo().isEmpty())
        && (prod.getCateGroup() == null || prod.getCateGroup().isEmpty())
        && (prod.getCateCode() == null || prod.getCateCode().isEmpty())
        && (prod.getColorCode() == null || prod.getColorCode().isEmpty())
        && (prod.getSize() == null || prod.getSize().isEmpty());
  }
}