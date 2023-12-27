package com.example.demo.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {

    @Autowired
    private HttpSession session;
    @Autowired
    private JoinService service;

    @RequestMapping("/join/regist")
    public String regist() {

        return "/join/regist";
    }

    @PostMapping("/registProc")
    public String registProc(JoinDTO joins, Model model) {
        String confirm = service.registProc(joins);

        if (confirm.equals("success")) {
            return "redirect:/join/login";
        }
        model.addAttribute("msg", confirm);
        return "/join/regist";
    }

    // @RequestMapping("/join/login")
    // public String login() {
    //     return "/join/login";
    // }

    @PostMapping("/loginProc")
    public String loginProc(HttpServletRequest request, String id, String pw, Model model) {
        String confirm = service.loginProc(request, id, pw);

        if (confirm.equals("success")) {
            return "redirect:/main/mainform";
        }
        model.addAttribute("msg", confirm);
        return "/join/login";
    }

    @RequestMapping("/logout")
    public String logout() {
        session.invalidate();

        return "redirect:/login";
    }

}