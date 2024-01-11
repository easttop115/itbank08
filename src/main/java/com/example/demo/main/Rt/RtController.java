package com.example.demo.main.Rt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RtController {
    @Autowired
    private RtService service;

    @RequestMapping("rt/instructionform")
    public String instructionform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.instructionform(cp, model);

        return "rt/instructionform";
    }

    @RequestMapping("rt/entryform")
    public String entryform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.entryform(cp, model);

        return "rt/entryform";
    }

    @RequestMapping("rt/exportform")
    public String exportform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.exportform(cp, model);

        return "rt/exportform";
    }

    @RequestMapping("rt/processingstform")
    public String processingstform(Model model, @RequestParam(value = "currentPage", required = false) String cp) {
        service.processingstform(cp, model);

        return "rt/processingstform";
    }

}
