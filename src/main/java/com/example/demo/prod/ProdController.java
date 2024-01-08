package com.example.demo.prod;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProdController {

    @Autowired
    ProdService service;

    @RequestMapping("prodInsert")
    public String prodInsert() {
        return "prod/prodInsert";
    }

    @PostMapping("/prodInsertProc")
    public String prodInsertProc(ProdDTO prods, Model model) {

        String msg = service.prodInsertProc(prods);

        if (msg.equals("상품등록 성공"))
            model.addAttribute("msg", msg);

        return "redirect:/";
    }

    @RequestMapping("prodManage")
    public String prodManage() {
        return "prod/prodManage";
    }

    @ResponseBody
    @PostMapping(value = "/prodManageProc", produces = "text/plain; application/json")

    public String prodList(@RequestParam Map<String, String> data) {

        String categoryCode = data.get("categoryCode");
        String brandCode = data.get("brandCode");
        String color = data.get("color");
        String size = data.get("size");

        List<ProdDTO> list = service.prodList(categoryCode, brandCode, color, size);

        return "redirect:/";

    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

}