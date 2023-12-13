package com.example.demo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
@Controller

public class MainController {
	 @Autowired private MainService service;

	    @Autowired private HttpSession session;
        @RequestMapping("main/mainform")
	    public String mainform(Model model,
	            @RequestParam(value="currentPage", required = false)String cp) {
	        service.mainform(cp, model);
	        return "main/mainform";
	    }


}