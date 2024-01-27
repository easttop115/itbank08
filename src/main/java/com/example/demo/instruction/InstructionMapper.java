package com.example.demo.instruction;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.orderStock.OrderStockDTO;
import com.example.demo.prod.ProdDTO;

@Mapper
public interface InstructionMapper {

    List<InstructionDTO> instructionGroupList();

    List<ProdDTO> searchProd();

    List<OrderStockDTO> orderStockList();

}
