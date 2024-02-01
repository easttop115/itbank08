package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.join.StoreDTO;
import com.example.demo.orderStock.OrderStockService;
import com.example.demo.prod.BrandDTO;
import com.example.demo.prod.CateDTO;
import com.example.demo.prod.ColorDTO;
import com.example.demo.prod.ProdDTO;
import com.example.demo.prod.ProdService;

import jakarta.servlet.http.HttpSession;

@Controller
public class InstructionController {
    @Autowired
    private InstructionService service;
    @Autowired
    private ProdService prodService;
    @Autowired
    private OrderStockService orderStockService;
    @Autowired
    private HttpSession session;

    @RequestMapping("/instruction/instructionform")
    public String instructionform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.instructionform(cp, model);

        return "/instruction/instructionform";
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

    @RequestMapping("/instruction/instructionwrite")
    public String instructionWrite(Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null) {
            return "redirect:/";
        }
        orderStockService.storeList(model);
        List<InstructionDTO> instructionDTOLists = service.getAllInstructionData();
        List<CateDTO> cateGroups = prodService.cateGroupList();
        List<CateDTO> cateCodes = prodService.cateCodeList();
        List<BrandDTO> brandCodes = prodService.brandCodeList();
        List<ColorDTO> colorCodes = prodService.colorCodeList();

        model.addAttribute("instructionDTOLists", instructionDTOLists);
        model.addAttribute("cateGroups", cateGroups);
        model.addAttribute("cateCodes", cateCodes);
        model.addAttribute("brandCodes", brandCodes);
        model.addAttribute("colorCodes", colorCodes);
        return "instruction/instructionwrite";
    }

    @PostMapping("/instruction/instructionwriteProc")
    public String instructionwriteProc(@RequestParam("selectedProducts") List<String> selectedProducts,
            @RequestParam("respQuan") List<Integer> respQuanList,
            List<StoreDTO> storeNameList, Model model) {

        for (int i = 0; i < selectedProducts.size(); i++) {
            if (respQuanList.get(i) != null && storeNameList.get(i) != null) { // 요청수량 또는 매장명이 있을 때만 실행
                String prodNo = selectedProducts.get(i);
                int respQuan = respQuanList.get(i);
                StoreDTO storeName = storeNameList.get(i);
                System.out.println("뭣이 중헌디?? : " + prodNo + "\n" + respQuan + "\n" +
                        storeName + " / 시마이");

                String confirm = service.instructionwriteProc(storeName, prodNo, respQuan);

                if (!confirm.equals("success")) {
                    model.addAttribute("msg", confirm);
                    return "instruction/instructionwrite";
                }
            }
        }
        return "instruction/instructionwrite";
    }

    @PostMapping("/searchInst")
    public String unprodList(@ModelAttribute("prod") ProdDTO prod,
            RedirectAttributes ra) {

        if (prod.getCateCode().trim().isEmpty()
                && prod.getCateGroup().trim().isEmpty()
                && prod.getColorCode().trim().isEmpty()
                && prod.getSize().trim().isEmpty()
                && prod.getProdNo().trim().isEmpty()) {
            System.out.println(prod.getCateCode());
            System.out.println(prod.getColorCode());
            return "redirect:/unstoring";
        }

        List<ProdDTO> plist = prodService.prodList(prod);
        ra.addFlashAttribute("prods", plist);
        System.out.println("확인" + plist);
        return "redirect:/instruction/instructionwrite";

    }

}
