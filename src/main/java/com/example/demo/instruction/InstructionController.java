package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    // @RequestMapping("/instruction/instructionwrite")
    // public String instructionwrite(Model model, ProdDTO prod) {
    // String sessionId = (String) session.getAttribute("id");
    // if (sessionId == null) {
    // return "redirect:/";
    // }
    // List<InstructionDTO> instructionGroups = service.instructionGroupList();

    // InstructionDTO.setInstructionDTO(instructionGroups);
    // InstructionDTO.setProdDTO(prodGroups);
    // InstructionDTO.setOrderStockDTO(orderStockGroups);

    // model.addAttribute("instructions",instructions);

    // return "instruction/instructionwrite";
    // }

    @GetMapping("/instruction/instructionwrite")
    public String instructionWrite(Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null) {
            return "redirect:/";
        }

        // InstructionDTO에 담을 데이터를 가져옴
        List<InstructionDTO> instructionDTOLists = service.getAllInstructionData();

        model.addAttribute("instructionDTOLists", instructionDTOLists);

        return "instruction/instructionwrite";
    }
}
