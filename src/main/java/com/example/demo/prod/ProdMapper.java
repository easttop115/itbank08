package com.example.demo.prod;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

@Mapper
public interface ProdMapper {

  int prodInsertProc(ProdDTO prods);

  List<CateDTO> cateGroupList();

  List<CateDTO> cateCodeList();

  List<BrandDTO> brandCodeList();

  List<ColorDTO> colorCodeList();

  List<ProdDTO> selectSearch();

  int addBrand(String brandCode, String brandDescription);

  List<ProdDTO> prodList(Map<String, String> params);

  int addCategory(String cateGroup, String cateCode, String cateName);

  int addColor(String colorCode, String colorName);
}
