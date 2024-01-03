package com.example.demo.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.mail.MailContents;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class JoinController {

    @Autowired
    private HttpSession session;
    @Autowired
    private JoinService service;
    @Autowired
    private MailContents mailContents;

    @RequestMapping("/join/regist")
    public String regist() {

        return "/join/regist";
    }

    @PostMapping("/registProc")
    public String registProc(@RequestParam(name = "email") String email, JoinDTO joins, Model model) throws Exception {
        String confirm = service.registProc(joins);

        if (confirm.equals("success")) {
            mailContents.sendSimpleMessage(email, joins); // 입력받은 email 값을 매개 변수로 메일 전송
            return "redirect:/";
        }
        model.addAttribute("msg", confirm);
        return "/join/regist";
    }

    // @RequestMapping("/join/login")
    // public String login() {
    // return "/join/login";
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