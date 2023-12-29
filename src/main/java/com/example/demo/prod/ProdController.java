package com.example.demo.prod;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProdController {

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

    @RequestMapping("prodManage")
    public String prodManage() {
        return "prod/prodManage";
    }

    @RequestMapping("insertProd")
    public String insertProd() {
        return "prod/insertProd";
    }

}