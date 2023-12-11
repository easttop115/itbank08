package com.example.demo.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class home {
    @RequestMapping("/index")
    public void requestMethodName() {}
    
}
