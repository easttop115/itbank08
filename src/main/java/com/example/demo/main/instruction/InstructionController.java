package com.example.demo.main.instruction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InstructionController {
    @Autowired
    private Instructionservice service;
    @Autowired
    private HttpSession session;

    @RequestMapping("rt/instructionform")
    public String instructionform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.instructionform(cp, model);

        return "rt/instructionform";
    }

}
