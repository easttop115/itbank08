package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.join.JoinDTO;
import com.example.demo.mail.MailContents;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private HttpSession session;
    @Autowired
    private AdminService service;
    @Autowired
    private MailContents mailContents;
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
            return "redirect:/adminInfo";

        model.addAttribute("msg", confirm);
        return "/admin/adminLogin";
    }

    @RequestMapping("/adminInfo")
    public String adminInfo(Model model, JoinDTO join) {
        String sessionId = (String) session.getAttribute("aId");
        AdminDTO admin = service.adminInfo(sessionId);
        if (admin == null || !admin.getAId().equals(sessionId))
            return "redirect:/";

        service.adminInfo(model, join);
        return "/admin/adminInfo";
    }

    // 관리자 이메일 승인 로직
    @GetMapping("/verifyProc")
    public String verifyProc(@RequestParam(name = "email") String email, Model model) throws Exception {
        JoinDTO checkAccount = service.checkAccount(email);
        String confirm = service.verifyProc(checkAccount);

        if (confirm.equals("success")) {
            mailContents.sendSimpleMessage(email, checkAccount);
            return "redirect:/adminInfo";
        }

        model.addAttribute("msg", confirm);
        return "/admin/adminInfo";
    }

    @RequestMapping("/adminStatusModify")
    public String adminStatusModify(@RequestParam("id") String selectId, JoinDTO join, Model model) {
        join.setId(selectId); // 선택한 사용자의 ID의 registStatus를 변경
        String confirm = service.adminStatusModify(join);
        if (confirm.equals("success")) {
            return "redirect:/adminInfo";
        }

        model.addAttribute("msg", confirm);
        return "/admin/adminInfo";
    }

    @RequestMapping("/adminRootDelete")
    public String adminRootDelete(@RequestParam("id") String selectId, JoinDTO join) {
        String sessionId = (String) session.getAttribute("aId");
        AdminDTO admin = service.adminInfo(sessionId);
        if (!admin.getAId().equals(sessionId))
            return "redirect:/";

        join.setId(selectId); // 선택한 사용자의 ID를 Proc으로

        return "/admin/adminRootDelete";
    }

    @PostMapping("/adminRootDeleteProc")
    public String adminRootDeleteProc(@RequestParam("id") String selectId, JoinDTO join, Model model) {
        join.setId(selectId); // 선택한 사용자의 ID를 삭제
        String confirm = service.adminRootDeleteProc(join);
        if (confirm.equals("success")) {
            return "redirect:/adminInfo";
        }

        model.addAttribute("msg", confirm);
        return "/admin/adminRootDelete";
    }
}
