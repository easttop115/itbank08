package com.example.demo.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DbConfig;
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
    private AdminMapper mapper;
    @Autowired
    private MailContents mailContents;
    @Autowired
    private DbConfig dbConfig;

    @RequestMapping("/admin/adminRegist")
    public String adminRegist(Model model) {
        List<AdminDTO> admin = mapper.findAll();
        if (!admin.isEmpty()) {
            model.addAttribute("msg", "permission denied");
            return "/admin/adminLogin";
        }

        return "/admin/adminRegist";
    }

    @PostMapping("/adminRegistProc")
    public String registProc(AdminDTO admins, Model model) {
        String confirm = service.adminRegistProc(admins, model);

        if (confirm.equals("success"))
            return "redirect:/suadonghyunyeonjidongwoonsangwon@SC";

        model.addAttribute("msg", confirm);
        return "/admin/adminRegist";
    }

    @RequestMapping("/suadonghyunyeonjidongwoonsangwon@SC")
    public String adminLogin() {
        dbConfig.setLogoutDatabase();

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
        if (sessionId == null)
            return "redirect:/";

        dbConfig.setLogoutDatabase(); // demo DB로 돌아와야 모든 회사의 정보가 보임
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
    public String adminStatusModify(@RequestParam("dbName") String selectDbName, JoinDTO join, Model model) {
        join.setDbName(selectDbName); // 선택한 사용자 dbName의 해당하는 registStatus를 모두 변경
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
        if (sessionId == null)
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

    @PostMapping("/createSubAccounts")
    public String createSubAccounts(HttpServletRequest request) throws Exception {
        String mainId = request.getParameter("mainId");
        String mainEmail = request.getParameter("mainEmail");
        int adCount = Integer.parseInt(request.getParameter("adCount"));
        int count = Integer.parseInt(request.getParameter("editAccount"));
        String dbName = request.getParameter("dbName");

        JoinDTO joins = mapper.checkMainId(mainId);
        joins.setId(mainId);
        joins.setEmail(mainEmail);
        joins.setRegistStatus("active");
        joins.setAdCount(Integer.toString(adCount));
        joins.setCount(Integer.toString(count));
        joins.setDbName(dbName);

        mailContents.sendSimpleMessage(mainEmail, joins);

        return "redirect:/adminInfo";
    }

}
