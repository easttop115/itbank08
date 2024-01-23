package com.example.demo.orderStock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.prod.ProdDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderStockController {

    @Autowired
    private HttpSession session;
    @Autowired
    private OrderStockService service;

    @RequestMapping("/storing")
    public String storing() {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            return "/join/login";

        return "/orderStock/storing";
    }

    @PostMapping("/storingProc")
    public String storingProc(ProdDTO prods) {
        String confirm = service.storingProc(prods);
        if (confirm.equals("success"))
            return "redirect:/storing";

        return "/orderStock/storing";
    }

    @PostMapping("/searchStoring")
    public String prodList(@ModelAttribute("prod") ProdDTO prod, RedirectAttributes ra) {

        if (prod.getCateCode().trim().isEmpty()
                && prod.getCateGroup().trim().isEmpty()
                && prod.getColorCode().trim().isEmpty()
                && prod.getSize().trim().isEmpty()
                && prod.getProdNo().trim().isEmpty()) {
            System.out.println(prod.getCateCode());
            System.out.println(prod.getColorCode());
            return "redirect:/storing";
        }
        System.out.println("cateGroup" + prod.getCateGroup());
        System.out.println("cateCode" + prod.getCateCode());
        System.out.println("colorCode" + prod.getColorCode());
        System.out.println("size" + prod.getSize());
        System.out.println("prodNo" + prod.getProdNo());

        // String cateC = cateGroup + "(" + prod.getCateCode() + ")";
        // prod.setCateCode(cateC);
        List<ProdDTO> plist = service.prodList(prod);
        ra.addFlashAttribute("prods", plist);
        System.out.println("확인" + plist);
        return "redirect:/storing";

    }

}
