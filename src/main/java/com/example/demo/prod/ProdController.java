package com.example.demo.prod;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProdController {

    @RequestMapping("product/stockManage")
    public void stockManage() {
    }

    @RequestMapping("product/insertProd")
    public void insertProd() {
    }
}