package com.example.demo.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DbConfig;
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
    @Autowired
    private DbConfig dbConfig;

    @RequestMapping("/join/regist")
    public String regist() {

        return "/join/regist";
    }

    @PostMapping("/registProc")
    public String registProc(@RequestParam(name = "email") String email, JoinDTO joins, Model model) throws Exception {
        String confirm = service.registProc(joins, model);

        if (confirm.equals("success")) {
            mailContents.sendSimpleMessage(email, joins); // 입력받은 email 값을 매개 변수로 메일 전송
            return "redirect:/";
        }
        model.addAttribute("msg", confirm);
        return "/join/regist";
    }

    // 관리자 이메일 승인 로직
    @GetMapping("/verifyProc")
    public String verifyProc(@RequestParam(name = "email") String email) throws Exception {
        JoinDTO checkAccount = service.checkAccount(email);
        String confirm = service.verifyProc(checkAccount);

        if (confirm.equals("success")) {
            mailContents.sendSimpleMessage(email, checkAccount);
            return "redirect:/";
        }

        return "";
    }

    @RequestMapping("/join/login")
    public String login() {
        return "/join/login";
    }

    @PostMapping("/loginProc")
    public String loginProc(HttpServletRequest request, String id, String pw, Model model) {
        String confirm = service.loginProc(request, id, pw);
        JoinDTO checkStatus = service.checkStatus(id);

        if (confirm.equals("success")) {
            if ("approve".equals(checkStatus.getRegistStatus()))
                return "redirect:/main/mainform";

            model.addAttribute("msg", "가입 미승인 회원입니다.");
            session.invalidate();
            return "/join/login";
        }
        model.addAttribute("msg", confirm);
        return "/join/login";
    }

    @RequestMapping("/logout")
    public String logout() {
        session.invalidate();
        dbConfig.setLogoutDatabase();

        return "redirect:/";
    }

    @RequestMapping("/userInfo")
    public String userInfo() {
        String sessionId = (String)session.getAttribute("id");

        if (sessionId != null)
            return "/join/userInfo";

        return "/join/login";
    }

    @RequestMapping("/update")
	public String update() {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:/";
		
		return "/join/update";
	}
	
	@PostMapping("/updateProc")
	public String updateProc(JoinDTO joins, Model model) {
		String sessionId = (String) session.getAttribute("id");
		
		joins.setId(sessionId);
		String confirm = service.updateProc(joins);
		if (confirm.equals("success")) {
			session.invalidate();
			return "redirect:/";
		}
		
		model.addAttribute("msg", confirm);
		return "/join/update";
	}

}