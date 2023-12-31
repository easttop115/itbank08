package com.example.demo.join;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.DbConfig;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class JoinService {

    @Autowired
    private HttpSession session;
    @Autowired
    private JoinMapper mapper;
    @Autowired
    private DbConfig dbConfig;

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
        } else if (joins.getAdCount() == null || joins.getAdCount().trim().isEmpty()) {
            return "운영 매장 개수를 입력해주세요.";
        } else if (!joins.getId().matches("^[a-z0-9]{4,20}$")) {
            return "아이디는 4~20자 영문, 숫자 입력 가능합니다.";
        } else if (!joins.getPw().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,20}$")) {
            return "비밀번호는 6~20자 대소문자, 숫자, !@#$%^&* 포함해야 합니다.";
        } else if (!joins.getCompany().matches("^[a-zA-Z][a-zA-Z0-9 ]*$")) { // 정규표현식 띄어쓰기는 9 뒤에 공백
            return "회사명은 영어로 시작 부탁드립니다.";
        } else if (Integer.parseInt(joins.getAdCount()) < 1) {
            return "1개 이상 등록해주세요.";
        } else if (Integer.parseInt(joins.getAdCount()) > 30) {
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
        joins.setAccountId("root");

        int maxAttempts = 1000000;
        int attemptCount = 0;
        String dbFirstName = joins.getCompany().substring(0, 3).toUpperCase();
        // dbName 컬럼 생성
        while (true) {

            int randomNum = new Random().nextInt(1000000); // 0부터 999999까지의 범위로 난수 생성
            String dbLastName = String.format("%06d", randomNum); // 난수를 6자리 문자열로 변환 (부족한 자릿수는 0으로 채움)

            String uniqueDbName = dbFirstName + dbLastName;

            JoinDTO checkDbName = mapper.findDbName(uniqueDbName);
            if (checkDbName == null) {
                // 중복이 없으면 dbName으로 설정하고 반복문 종료
                joins.setDbName(uniqueDbName);
                break;
            }

            attemptCount++;
            if (attemptCount >= maxAttempts) {
                // 만약 최대 시도 횟수를 초과하면 강제로 종료
                return "오류가 발생했습니다. 해결을 위해 연락 부탁드립니다.";
            }
        }
        int result = mapper.registProc(joins);
        if (result <= 0)
            return "회원가입 실패. 다시 시도해주세요.";

        return "success";
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

    public JoinDTO checkAccount(String email) {
        return mapper.checkAccount(email);
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

        JoinDTO checkId = mapper.findJoin(id);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        if (checkId != null && encoder.matches(pw, checkId.getPw()) == true) {
            session.setAttribute("id", checkId.getId());
            session.setAttribute("email", checkId.getEmail());
            session.setAttribute("company", checkId.getCompany());
            session.setAttribute("businessNo", checkId.getBusinessNo());
            session.setAttribute("tel", checkId.getTel());
            session.setAttribute("accountId", checkId.getAccountId());
            String dbName = checkId.getDbName();
            dbConfig.setDynamicDatabase(dbName);
            return "success";
        }
        return "확인 후 다시 시도해주세요.";
    }

    public JoinDTO checkStatus(String id) {
        return mapper.checkStatus(id);
    }

    public String updateProc(JoinDTO joins) {
        if (joins.getPw() == null || joins.getPw().trim().isEmpty()) {
			return "비밀번호를 입력해주세요.";
		} else if (joins.getPw().equals(joins.getConfirm()) == false) {
			return "두 비밀번호가 다릅니다.";
		} else if (joins.getEmail() == null || joins.getEmail().trim().isEmpty()) {
			return "이메일을 입력해주세요.";
		} else if (joins.getTel() == null || joins.getTel().trim().isEmpty()) {
            return "전화번호를 입력해주세요.";
        } else if (!joins.getPw().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,20}$")) {
	        return "비밀번호는 6~20자 대소문자, 숫자, !@#$%^&* 포함해야 합니다.";
	    }
		// 암호화 과정
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String secretPass = encoder.encode(joins.getPw());
		joins.setPw(secretPass);

		int result = mapper.updateProc(joins);
		if (result > 0)
			return "success";

		return "failed";
    }

}
