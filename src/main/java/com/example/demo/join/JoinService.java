package com.example.demo.join;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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

    public String registProc(JoinDTO joins, Model model) {
        if (joins.getId() == null || joins.getId().trim().isEmpty()) {
            return "아이디를 입력해주세요.";
        } else if (joins.getPw() == null || joins.getPw().trim().isEmpty()) {
            return "비밀번호를 입력해주세요.";
        } else if (joins.getPw().equals(joins.getConfirm()) == false) {
            return "두 비밀번호가 다릅니다.";
        } else if (joins.getCompany() == null || joins.getCompany().trim().isEmpty()) {
            return "회사명을 입력해주세요.";
        } else if (joins.getBusinessNo() == null || joins.getBusinessNo().trim().isEmpty()) {
            return "사업자등록번호를 입력해주세요.";
        } else if (joins.getEmail() == null || joins.getEmail().trim().isEmpty()) {
            return "이메일을 입력해주세요.";
        } else if (joins.getTel() == null || joins.getTel().trim().isEmpty()) {
            return "전화번호를 입력해주세요.";
        } else if (joins.getAdAccount() == null || joins.getAdAccount().trim().isEmpty()) {
            return "예상 지점 수를 입력해주세요.";
        } else if (!joins.getId().matches("^[a-zA-Z0-9]{4,20}$")) {
            return "아이디는 영문, 숫자, 4~20자 입력 가능합니다.";
        } else if (!joins.getPw().matches("^[a-zA-Z0-9!@#$%^&*]{6,20}$")) {
            return "비밀번호는 영문, 숫자, !@#$%^&*, 6~20자 입력 가능합니다.";
        } else if (Integer.parseInt(joins.getAdAccount()) > 30) {
            return "지점 31개 이상 등록은 문의 부탁드립니다.";
        }

        JoinDTO checkId = mapper.findJoin(joins.getId());
        if (checkId != null) {
            return "존재하는 아이디입니다.";
        }

        JoinDTO checkBusinessNo = mapper.findBN(joins.getBusinessNo());
        if (checkBusinessNo != null) {
            return "존재하는 사업자등록번호입니다.";
        }

        JoinDTO checkEmail = mapper.findEmail(joins.getEmail());
        if (checkEmail != null) {
            return "존재하는 이메일입니다.";
        }

        JoinDTO checkTel = mapper.findTel(joins.getTel());
        if (checkTel != null) {
            return "존재하는 전화번호입니다.";
        }

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String secretPw = encoder.encode(joins.getPw());
        joins.setPw(secretPw);

        int result = mapper.registProc(joins);
        if (result <= 0)
            return "회원가입 실패. 다시 시도해주세요.";

        List<JoinDTO> subJoins = mapper.subJoins(joins);

        model.addAttribute("subJoins", subJoins);

        return "success";
    }

    public String verifyProc(String email) {
        JoinDTO joins = new JoinDTO();
        joins.setEmail(email);
        joins.setRegistStatus("승인");
        int result = mapper.verifyProc(joins);
        if (result > 0)
            return "success";

        return "fail";
    }

    public String loginProc(HttpServletRequest request, String id, String pw) {
        HttpSession sessionCheck = request.getSession(false);
        if (sessionCheck != null) {
            sessionCheck.invalidate();
        }
        if (id == null || id.trim().isEmpty()) {
            return "아이디를 입력해주세요.";
        }
        if (pw == null || pw.trim().isEmpty()) {
            return "비밀번호를 입력해주세요.";
        }

        JoinDTO check = mapper.findJoin(id);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        if (check != null && encoder.matches(pw, check.getPw()) == true) {
            session.setAttribute("id", check.getId());
            // String sessionId = (String) session.getAttribute("id");
            // dbConfig.setDynamicDatabase(sessionId);
            return "success";
        }
        return "확인 후 다시 시도해주세요.";
    }

}
