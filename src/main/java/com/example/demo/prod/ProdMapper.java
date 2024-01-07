package com.example.demo.prod;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProdMapper {

  int insertProdProc(ProdDTO prods);

}
