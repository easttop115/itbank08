package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.orderStock.OrderStockDTO;
import com.example.demo.prod.BrandDTO;
import com.example.demo.prod.CateDTO;
import com.example.demo.prod.ColorDTO;
import com.example.demo.prod.ProdDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class InstructionController {
    @Autowired
    private InstructionService service;
    @Autowired
    private HttpSession session;

    @RequestMapping("/instruction/instructionform")
    public String instructionform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.instructionform(cp, model);

        return "instruction/instructionform";
    }

    @RequestMapping("/instruction/instructionwrite")
    public String instructionwrite(Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null) {
            return "redirect:/";
        }
        List<InstructionDTO> instructionGroups = service.instructionGroupList();
        List<ProdDTO> prodGroups = service.prodList();
        List<OrderStockDTO> orderStockGroups = service.orderStockList();
        InstructionDTOS instructionDTOS = new InstructionDTOS();
        instructionDTOS.setInstructionDTOs(instructionGroups);
        instructionDTOS.setProdDTOs(prodGroups);
        instructionDTOS.setOrderStockDTOs(orderStockGroups);

        model.addAttribute("instructions", instructionDTOS);

        return "instruction/instructionwrite";
    }

}
