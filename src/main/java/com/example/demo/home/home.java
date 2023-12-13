package com.example.demo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class home {
    @RequestMapping("/index")
    public void requestMethodName() {
    }

    @RequestMapping("/header")
    public String header() {
        return "/default/header";
    }

    @RequestMapping("/main")
    public String main() {
        return "/default/main";
    }
}
