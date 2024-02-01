package com.example.demo.instruction;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.prod.ProdDTO;

@Mapper
public interface InstructionMapper {

    List<InstructionDTO> instructionGroupList();

    Collection<? extends InstructionDTO> prodList();

    Collection<? extends InstructionDTO> orderStockList();

    Collection<? extends InstructionDTO> cateList();

    Collection<? extends InstructionDTO> colorList();

    ProdDTO findRootProd(ProdDTO prod);

    void updateRootQuan(ProdDTO prod);

    ProdDTO findStoreProd(ProdDTO prod);

    void updateStoreProd(ProdDTO findStoreProd);

    void insertStoreProd(ProdDTO findRootProd);

    int instwriteProc(String storeName, String prodNo, int respQuan);

}
