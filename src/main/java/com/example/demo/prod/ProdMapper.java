package com.example.demo.prod;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.join.StoreDTO;

@Mapper
public interface ProdMapper {

  int prodInsertProc(ProdDTO prods);

  List<CateDTO> cateGroupList();

  List<CateDTO> cateCodeList();

  List<BrandDTO> brandCodeList();

  List<ColorDTO> colorCodeList();

  List<ProdDTO> selectSearch();

  int addBrand(BrandDTO brand);

  int addCategory(CateDTO cate);

  int addColor(ColorDTO color);

  List<ProdDTO> searchProd(ProdDTO prod);

  ProdDTO findById(String prodNo);

  void updateProd(String prodNo, int incomePrice, int sellPrice, String prodCon);

  List<String> storeNameList();

  String connectName(String id);
}
