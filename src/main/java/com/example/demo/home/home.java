package com.example.demo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class home {
    @RequestMapping("/")
    public String homePage() {
        return "/join/login";
    }

    @RequestMapping("/index")
    public String index() {
        return "/test/index";
    }

    @RequestMapping("/header")
    public String header() {
        return "/default/header";
    }

    @RequestMapping("/main")
    public String main() {
        return "/default/main";
    }

    @RequestMapping("/stockManage")
    public void stockManage() {
    }
}
