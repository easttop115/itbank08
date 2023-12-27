package com.example.demo.join;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

//import com.example.demo.DbConfig;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class JoinService {

    @Autowired
    private HttpSession session;
    @Autowired
    private JoinMapper mapper;
    // @Autowired
    // private DbConfig dbConfig;

    public String registProc(JoinDTO joins) {
        if (joins.getId() == null || joins.getId().trim().isEmpty()) {
            return "failed";
        } else if (joins.getPw() == null || joins.getPw().trim().isEmpty()) {
            return "failed";
        } else if (joins.getCompany() == null || joins.getCompany().trim().isEmpty()) {
            return "failed";
        } else if (joins.getBusinessNo() == null || joins.getBusinessNo().trim().isEmpty()) {
            return "failed";
        } else if (joins.getEmail() == null || joins.getEmail().trim().isEmpty()) {
            return "failed";
        } else if (joins.getTel() == null || joins.getTel().trim().isEmpty()) {
            return "failed";
        } else if (!joins.getId().matches("^[a-zA-Z0-9]{4,20}$")) {
            return "failed";
        } else if (!joins.getPw().matches("^[a-zA-Z0-9!@#$%^&*]{6,20}$")) {
            return "failed";
        }

        JoinDTO checkId = mapper.findJoin(joins.getId());
        if (checkId != null) {
            return "exist id";
        }

        JoinDTO checkBusinessNo = mapper.findJoin(joins.getId());
        if (checkBusinessNo != null) {
            return "exist businessNo";
        }

        JoinDTO checkTel = mapper.findJoin(joins.getTel());
        if (checkTel != null) {
            return "exist tel";
        }

        JoinDTO checkEmail = mapper.findJoin(joins.getEmail());
        if (checkEmail != null) {
            return "exist email";
        }

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String secretPw = encoder.encode(joins.getPw());
        joins.setPw(secretPw);

        System.out.println(secretPw.length());

        int result = mapper.registProc(joins);
        if (result <= 0)
            return "insert failed";

        return "success";
    }

    public String loginProc(HttpServletRequest request, String id, String pw) {
        HttpSession sessionCheck = request.getSession(false);
        if (sessionCheck != null) {
            sessionCheck.invalidate();
        }
        if (id == null || id.trim().isEmpty()) {
            return "insert id";
        }
        if (pw == null || pw.trim().isEmpty()) {
            return "insert pw";
        }

        JoinDTO check = mapper.findJoin(id);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        if (check != null && encoder.matches(pw, check.getPw()) == true) {
            session.setAttribute("id", check.getId());
            String sessionId = (String) session.getAttribute("id");
            // dbConfig.setDynamicDatabase(sessionId);
            return "success";
        }
        return "login failed";
    }

}
