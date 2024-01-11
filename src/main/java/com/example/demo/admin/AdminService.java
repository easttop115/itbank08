package com.example.demo.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.join.JoinDTO;

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
            return "null typed";

        AdminDTO checkId = mapper.findAdmin(aId);
        // BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // if (checkId != null && encoder.matches(aPw, checkId.getAPw()) == true) {
        if (checkId != null && aPw.matches(checkId.getAPw())) {
            session.setAttribute("aId", checkId.getAId());

            return "success";
        }
        // }
        return "failed";
    }

    public void adminInfo(Model model, JoinDTO join) {
        ArrayList<JoinDTO> joins = mapper.adminInfo(join);

        // dto와 joins 둘 다 JoinDTO의 값을 참조하기 때문에
        // dto.set~~~의 값을 따로 joins에 저장하지 않아도 JoinDTO에 적용됨
        for (JoinDTO dto : joins) {
            String regDate = dto.getRegDate();

            if (!"X".equals(regDate))
                dto.setRegDate(regDate.substring(0, 10));
            else
                dto.setRegDate(regDate);
        }

        model.addAttribute("joins", joins);
    }

    public AdminDTO adminInfo(String sessionId) {
        return mapper.findAdmin(sessionId);
    }

    public JoinDTO checkAccount(String email) {
        return mapper.checkAccount(email);
    }

    public String verifyProc(JoinDTO checkAccount) {
        checkAccount.setRegistStatus("approve");

        int result = mapper.verifyProc(checkAccount);
        if (result > 0) {
            // String userName = checkAccount.getDbName();
            // dbConfig.createSetDatabase(userName);
            return "success";
        }
        return "fail";
    }

    public String adminStatusModify(JoinDTO join) {
        int result = mapper.adminStatusModify(join);
        if (result > 0)
            return "success";

        return "failed";
    }

    public String adminRootDeleteProc(JoinDTO join) {
        int result = mapper.adminRootDeleteProc(join);
        if (result > 0)
            return "success";

        return "failed";
    }

}
