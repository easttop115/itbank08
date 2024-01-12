package com.example.demo.chat;

import java.sql.Timestamp;
import lombok.Getter;

@Getter
public class ChatLogDTO {

    private Long no; // 채팅 로그 번호
    private int chatroomNo; // 채팅방 번호
    private String userId; // 사용자 아이디
    private String message; // 채팅 메시지
    private Timestamp timestamp; // 타임스탬프

    // 필요한 매개변수를 받는 생성자 추가
    public ChatLogDTO(int chatroomNo, String userId, String message) {
        this.chatroomNo = chatroomNo;
        this.userId = userId;
        this.message = message;
        this.timestamp = new Timestamp(System.currentTimeMillis());
    }
}
