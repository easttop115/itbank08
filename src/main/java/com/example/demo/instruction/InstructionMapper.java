package com.example.demo.instruction;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InstructionMapper {

    List<InstructionDTO> instructionGroupList();

    Collection<? extends InstructionDTO> prodList();

    Collection<? extends InstructionDTO> orderStockList();

}
