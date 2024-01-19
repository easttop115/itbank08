package com.example.demo.prod;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProdMapper {

  int prodInsertProc(ProdDTO prods);

  List<CateDTO> cateGroupList();

  List<CateDTO> cateCodeList();

  List<BrandDTO> brandCodeList();

  List<ColorDTO> colorCodeList();

  List<ProdDTO> selectSearch();

  int addBrand(String brandCode, String brandDescription);

  int addCategory(String cateGroup, String cateCode, String cateName);

  int addColor(String colorCode, String colorName);

  // List<ProdDTO> prodList(String cateCode, String colorCode, String size, String
  // prodNo);

  List<ProdDTO> searchProd(ProdDTO prod);

  ProdDTO findById(String prodNo);

  void updateProd(String prodNo, int incomePrice, int sellPrice, String prodCon);
}
