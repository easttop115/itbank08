package com.example.demo.join;

import org.springframework.web.bind.annotation.RequestMapping;

public class JoinController {

    @RequestMapping("join/login")
    public String login() {
        return "join/login";
    }

    @RequestMapping("join/regist")
    public String regist() {
        return "join/regist";
    }
}