package com.example.demo.join;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class JoinService {

    @Autowired
    private HttpSession session;
    @Autowired
    private JoinMapper mapper;

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

		MemberDTO check = mapper.login(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		encoder.matches(pw, check.getPw()); // 매개변수 순서 중요 - 좌 : 평문, 우 : 암호문

		if (check != null && encoder.matches(pw, check.getPw()) == true) {
			session.setAttribute("id", check.getId());
			session.setAttribute("userName", check.getUserName());
			session.setAttribute("address", check.getAddress());
			session.setAttribute("mobile", check.getMobile());
			session.setAttribute("email", check.getEmail());

			// session.setAttribute("member", check);
			// ${sessionScope.member.id}
			// ${sessionScope.member.pw}
			// ${sessionScope.member.userName}

			return "로그인 성공";
		}
        return "success";
    }

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

		JoinDTO checkEmail = mapper.findJoin(joins.getEmail());
		if (checkEmail != null) {
			return "exist email";
		}

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPw = encoder.encode(joins.getPw());
		joins.setPw(secretPw);

		System.out.println(secretPw.length());

		int result = mapper.registProc(joins);
		if (result < 1)
			return "insert failed";

        return "success";
    }

}
