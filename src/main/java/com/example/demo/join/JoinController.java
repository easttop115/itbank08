package com.example.demo.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {

    @Autowired
    private HttpSession session;
    @Autowired
    private JoinService service;

    @RequestMapping("/login")
    public String login() {
        return "/join/login";
    }

    @PostMapping("/loginProc")
    public String loginProc(HttpServletRequest request, String id, String pw) {
        String confirm = service.loginProc(request, id, pw);

        if (confirm.equals("success")) {
            return "redirect:/mainForm";
        }
        return "/join/login";
    }

    @RequestMapping("/logout")
    public String logout() {
        session.invalidate();

        return "redirect:/login";
    }

    @RequestMapping("/join/regist")
    public String regist() {

        return "/join/regist";
    }

    @PostMapping("registProc")
	public String registProc(JoinDTO joins) {	
		String confirm = service.registProc(joins);

		if (confirm.equals("success")) {
			return "redirect:/login";
		}
		return "/join/regist";
	}
}