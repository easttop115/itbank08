package com.example.demo.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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

	// 메일 내용 작성
	@Override
	public MimeMessage creatMessage(String to, JoinDTO joins) throws MessagingException, UnsupportedEncodingException {

		int count = Integer.parseInt(joins.getAdAccount());
		String mainId = joins.getId();

		// 각각의 서브 계정에 대한 논리 추가
		for (int i = 1; i <= count; i++) {
			String subAccountId = joins.getId() + "_" + String.format("%02d", i);
			String ePw = createKey();

			MimeMessage message = emailSender.createMimeMessage();

			message.addRecipients(RecipientType.TO, to); // 메일 받을 사용자
			message.setSubject("[Stock City] 발급된 사용자 계정입니다"); // 이메일 제목

			String msgg = "";

			msgg += "<h1>안녕하세요</h1>";
			msgg += "<h1>Stock City 입니다</h1>";
			msgg += "<br>";
			msgg += "<p>사이트에서 이용하실 계정입니다</p>";
			msgg += "<br>";
			msgg += "<br>";
			msgg += "<div align='center' style='border: 3px solid #2895F4'>";
			msgg += "<h3 style='color: black'>이용해주셔서 감사합니다</h3>";
			msgg += "<div style='font-size: 130%'>";
			msgg += "<strong>아이디 : " + subAccountId + "</strong></div>";
			msgg += "<div style='font-size: 130%'>";
			msgg += "<strong>비밀번호 : " + ePw + "</strong></div><br>";
			msgg += "</div>";

			message.setText(msgg, "utf-8", "html");
			message.setFrom(new InternetAddress("qorthgml2002@naver.com", "Stock City"));

			System.out.println("생성된 subAccountId: " + subAccountId);

			sendSingleMessage(to, message); // send 메서드 호출 전에 메시지를 생성하는 것이 중요

			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String secretPw = encoder.encode(ePw);
			joins.setId(subAccountId);
			joins.setPw(secretPw);

			mapper.registProc(joins);

			joins.setId(mainId); // 초기화 작업 : 초기화 안하면 id_01_02 이렇게 숫자가 뒤로 붙음
		}
		return null;
	}

	private void sendSingleMessage(String to, MimeMessage message) {
		try {
			emailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
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
