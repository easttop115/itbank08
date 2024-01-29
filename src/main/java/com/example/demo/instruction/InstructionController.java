package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.notice.NoticeDTO;
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

    @PostMapping("/searchProdNo")
    public String searchProdNo(InstructionDTO instruction, Model model) {
        System.out.println(instruction.getProdNo());

        List<InstructionDTO> nlist = service.searchProdNo(instruction);
        model.addAttribute("instructions", nlist);
        System.out.println("확인: " + nlist);
        return "instruction/instructionwrite";
    }

    @PostMapping("modalList")
    public String modalList(@ModelAttribute("instruction") InstructionDTO instruction, RedirectAttributes ra) {

        if (instruction.getCateCode().trim().isEmpty()
                && instruction.getCateGroup().trim().isEmpty()
                && instruction.getColorCode().trim().isEmpty()
                && instruction.getSize().trim().isEmpty()
                && instruction.getProdNo().trim().isEmpty()) {
            System.out.println(instruction.getCateCode());
            System.out.println(instruction.getColorCode());
            return "redirect:/instruction/instructionwrite";
        }
        System.out.println("cateGroup" + instruction.getCateGroup());
        System.out.println("cateCode" + instruction.getCateCode());
        System.out.println("colorCode" + instruction.getColorCode());
        System.out.println("size" + instruction.getSize());
        System.out.println("prodNo" + instruction.getProdNo());

        List<InstructionDTO> plist = service.instructionList(instruction);
        ra.addFlashAttribute("instructions", plist);
        System.out.println("확인" + plist);
        return "redirect:/instruction/instructionwrite";

    }

}
