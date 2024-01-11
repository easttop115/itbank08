package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private HttpSession session;
    @Autowired
    private AdminService service;
    // @Autowired
    // private DbConfig dbConfig;

    @RequestMapping("/suadonghyunyeonjidongwoonsangwon@SC")
    public String adminLogin() {
        return "/admin/adminLogin";
    }

    @PostMapping("/adminLoginProc")
    public String adminLoginProc(HttpServletRequest request, String aId, String aPw, Model model) {
        String confirm = service.adminLoginProc(request, aId, aPw);

        if (confirm.equals("success"))
            return "redirect:/admin/adminInfo";

        model.addAttribute("msg", confirm);
        return "/admin/adminLogin";
    }

    @RequestMapping("/adminLogout")
    public String adminLogout() {
        session.invalidate();
        // dbConfig.setLogoutDatabase();

        return "redirect:/";
    }
}
