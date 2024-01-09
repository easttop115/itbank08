package com.example.demo.prod;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

@Mapper
public interface ProdMapper {

  int prodInsertProc(ProdDTO prods);

  List<CateDTO> cateGroupList();

  List<CateDTO> cateCodeList();

  List<BrandDTO> brandCodeList();

  List<ColorDTO> colorCodeList();

  List<ProdDTO> selectSearch();

  List<ProdDTO> selectProdNo(String prodNo);
}
