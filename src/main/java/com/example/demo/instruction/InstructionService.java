package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.example.demo.orderStock.OrderStockDTO;
import com.example.demo.prod.BrandDTO;
import com.example.demo.prod.ProdDTO;
import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class InstructionService {

    @Autowired
    private ProdDTO prodDTO;
    @Autowired
    private InstructionMapper mapper;
    @Autowired
    private HttpSession session;

    public void instructionform(String cp, Model model) {

    }

    public void instructionwrite(String cp, Model model) {

    }

    public List<InstructionDTO> instructionGroupList() {
        List<InstructionDTO> instructions = mapper.instructionGroupList();
        return instructions;

    }

    public List<ProdDTO> prodList() {

        return mapper.searchProd();
    }

    public List<OrderStockDTO> orderStockList() {
        List<OrderStockDTO> orderStocks = mapper.orderStockList();
        return orderStocks;

    }

}
