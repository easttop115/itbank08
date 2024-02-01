package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.example.demo.prod.ProdDTO;
import com.example.demo.prod.ProdMapper;

import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class InstructionService {
    @Autowired
    private InstructionMapper mapper;
    @Autowired
    private HttpSession session;
    @Autowired
    private ProdMapper prodmapper;

    public void instructionform(String cp, Model model) {

    }

    public void instructionwrite(String cp, Model model) {

    }

    // public List<InstructionDTO> instructionGroupList() {
    // List<InstructionDTO> instructions = mapper.instructionGroupList();
    // return instructions;

    // }

    // public List<ProdDTO> prodList() {

    // return mapper.searchProd();
    // }

    // public List<OrderStockDTO> orderStockList() {
    // List<OrderStockDTO> orderStocks = mapper.orderStockList();
    // return orderStocks;

    // }
    @Autowired
    public InstructionService(InstructionMapper mapper) {
        this.mapper = mapper;
    }

    public List<InstructionDTO> getAllInstructionData() {
        List<InstructionDTO> instructionDTOList = mapper.instructionGroupList();
        instructionDTOList.addAll(mapper.prodList());
        instructionDTOList.addAll(mapper.orderStockList());
        instructionDTOList.addAll(mapper.cateList());
        instructionDTOList.addAll(mapper.colorList());

        return instructionDTOList;
    }

    public String instructionwriteProc(String prodNo, int respQuan, String storeName) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'instructionwriteProc'");
    }

}
