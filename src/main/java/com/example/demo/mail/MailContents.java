package com.example.demo.mail;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.DbConfig;
import com.example.demo.join.JoinDTO;
import com.example.demo.join.JoinMapper;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class MailContents implements IMailService {

	@Autowired
	JavaMailSender emailSender;
	@Autowired
	JoinMapper mapper;
	@Autowired
	DbConfig dbConfig;

	// 메일 내용 작성
	@Override
	public MimeMessage creatMessage(String to, JoinDTO joins) throws MessagingException, UnsupportedEncodingException {
		String rootEmail = "qorthgml2002@naver.com";
		int count = Integer.parseInt(joins.getAdCount());
		String mainId = joins.getId();

		MimeMessage message;
		String msgg;
		System.out.println(joins.getRegistStatus());
		// 관리자 전송 메일
		if (!"approve".equals(joins.getRegistStatus())) {
			message = emailSender.createMimeMessage();

			message.addRecipients(RecipientType.TO, rootEmail); // 메일 받을 사용자
			message.setSubject("[Stock City] 서비스 이용 승인 요청"); // 이메일 제목

			msgg = "";

			msgg += "<h1>계정 승인 요청이 있습니다.</h1>";
			msgg += "<br>";
			msgg += "<div align='center' style='border:3px solid #2895F4'>";
			msgg += "<div style='font-size:130%'><br>";
			msgg += "<strong>" + to + "</strong></div><br>";
			msgg += "<a style=\"text-decoration: none;\" href='http://localhost/verifyProc?email=" + to + "'>승인</a><br><br>";
			msgg += "</div>";

			message.setText(msgg, "utf-8", "html");
			message.setFrom(new InternetAddress("qorthgml2002@naver.com", "Stock City"));

			sendSingleMessage(rootEmail, message);
		}
		// 사용자 전송 메일
		if ("approve".equals(joins.getRegistStatus())) { // "approve"이면 메일 발신 및 DB 데이터 생성

			List<SubAccountDTO> subAccountList = new ArrayList<>(); // 서브 계정 정보를 담을 리스트 생성

			// 서브 계정 생성
			for (int i = 1; i <= count; i++) {
				String subAccountId = joins.getId() + "_" + String.format("%02d", i);
				String ePw = createKey();

				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				String secretPw = encoder.encode(ePw);
				joins.setId(subAccountId);
				joins.setPw(secretPw);
				joins.setBusinessNo(null);
				joins.setEmail(null);
				joins.setTel(null);
				joins.setRegistStatus("approve");
				joins.setAccountId(null);

				mapper.registProc(joins);

				// 서브 계정 정보를 리스트에 담기
				SubAccountDTO subAccountInfo = new SubAccountDTO(subAccountId, ePw);
				subAccountList.add(subAccountInfo);

				joins.setId(mainId); // 초기화 작업 : 초기화 안하면 id_01_02 이렇게 숫자가 뒤로 붙음
			}
			dbConfig.createSetDatabase(joins.getDbName());
			message = emailSender.createMimeMessage();

			message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
			message.setSubject("[Stock City] 발급된 사용자 계정입니다"); // 이메일 제목

			msgg = "";

			msgg += "<h1>안녕하세요</h1>";
			msgg += "<h1>Stock City 입니다</h1>";
			msgg += "<br>";
			msgg += "<p>사이트에서 이용하실 계정입니다</p>";
			msgg += "<br>";
			msgg += "<br>";
			msgg += "<div align='center' style='border: 3px solid #2895F4'>";
			msgg += "<h3 style='color: black'>이용해주셔서 감사합니다</h3>";
			msgg += "<c:choose><c:when test=\"${subJoins}\">";
			msgg += "<table style='border: 2px solid rgb(255, 255, 255); border-collapse: collapse; width: 80%; margin: 0 auto;'>";
			msgg += "<thead><tr>";
			msgg += "<th style='font-weight: bold; color: white; background-color: #2895F4;'>아이디</th>";
			msgg += "<th style='font-weight: bold; color: white; background-color: #2895F4;'>비밀번호</th>";
			msgg += "</tr></thead>";
			msgg += "<tbody>";
			for (SubAccountDTO subAccount : subAccountList) {
				msgg += "<tr><td style='border: 2px solid rgb(232, 232, 232); text-align: center; padding: 10px;'>"
						+ subAccount.getSubAccountId() + "</td>";
				msgg += "<td style='border: 2px solid rgb(232, 232, 232); text-align: center; padding: 10px;'>"
						+ subAccount.getEPw() + "</td></tr>";
			}
			msgg += "</tbody></table></c:when></c:choose><br></div>";

			message.setText(msgg, "utf-8", "html");
			message.setFrom(new InternetAddress("qorthgml2002@naver.com", "Stock City"));

			sendSingleMessage(to, message); // send 메서드 호출 전에 메시지를 생성하는 것이 중요
		}

		return null;
	}

	private void sendSingleMessage(String to, MimeMessage message) {
		try {
			emailSender.send(message);
		} catch (Exception e) {
			System.err.println("Failed to send email to " + to + ": " + e.getMessage());
			e.printStackTrace();
			// throw new IllegalArgumentException();
		}
	}

	// 랜덤 인증코드 생성
	@Override
	public String createKey() {
		int leftLimit = 48;
		int rightLimit = 122;
		int targetStringLength = 10;
		Random random = new Random();
		String key = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
				.limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
				.toString();
		System.out.println("생성된 랜덤 비밀번호 : " + key);
		return key;
	}

	// 메일 발송
	@Override
	public void sendSimpleMessage(String to, JoinDTO joins) throws Exception {
		creatMessage(to, joins);
	}
}
