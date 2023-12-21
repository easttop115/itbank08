package com.example.demo.join;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {

    @RequestMapping("/join/login")
    public String login() {
        return "/join/login";
    }

    @RequestMapping("/join/regist")
    public String regist() {
        return "/join/regist";
    }

    @PostMapping("/regiProc")
    public String regiProc() {
        return "redirect:/index";
    }
}