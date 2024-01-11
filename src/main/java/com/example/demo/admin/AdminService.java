package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {

    @Autowired
    private HttpSession session;
    @Autowired
    private AdminMapper mapper;

    public String adminLoginProc(HttpServletRequest request, String aId, String aPw) {
        HttpSession sessionCheck = request.getSession(false);
        if (sessionCheck != null) {
            sessionCheck.invalidate();
        }
        if (aId == null || aId.trim().isEmpty() || aPw == null || aPw.trim().isEmpty())
            return "";

        AdminDTO checkId = mapper.findAdmin(aId);
        // BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // if (checkId != null && encoder.matches(aPw, checkId.getAPw()) == true) {
        if (checkId != null) {
            session.setAttribute("aId", checkId.getAId());

            return "success";
        }
        // }
        return "failed";
    }

}
