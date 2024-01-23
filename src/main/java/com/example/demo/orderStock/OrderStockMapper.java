package com.example.demo.orderStock;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.prod.ProdDTO;

@Mapper
public interface OrderStockMapper {

    int storingProc(ProdDTO prods);

    List<ProdDTO> searchProd(ProdDTO prod);

}
