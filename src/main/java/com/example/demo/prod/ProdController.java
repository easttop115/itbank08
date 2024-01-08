package com.example.demo.prod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProdController {

    @Autowired
    ProdService service;

    @RequestMapping("insertProd")
    public String insertProd() {
        return "prod/insertProd";
    }

    @PostMapping("/insertProdProc")
    public String insertProdProc(ProdDTO prods, Model model) {

        String msg = service.insertProdProc(prods);

        if (msg.equals("상품등록 성공"))
            model.addAttribute("msg", msg);

        return "redirect:/";
    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

    @RequestMapping("prodManage")
    public String prodManage() {
        return "prod/prodManage";
    }

}