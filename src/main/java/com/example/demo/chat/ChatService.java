package com.example.demo.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {

    @Autowired
    private ChatMapper mapper;

    // 채팅 로그 저장
    public void saveChatLog(ChatLogDTO chatLogDTO) {
        mapper.insertChatLog(chatLogDTO);
    }

    // 특정 채팅방의 채팅 로그 리스트 가져오기
    public List<ChatLogDTO> getChatLogsByChatroomNo(int chatroomNo) {
        return mapper.selectChatLogsByChatroomNo(chatroomNo);
    }

    // 모든 채팅방 가져오기
    public List<ChatRoomDTO> getAllChatrooms() {
        return mapper.selectAllChatrooms();
    }

    // 채팅방에 메시지 전송
    public void sendMessageToRoom(String roomId, ChatRoomDTO chatRoomDTO) {
        // 이 부분은 WebSocket을 사용하여 해당 채팅방에 메시지를 전송하는 로직입니다.
        // WebSocket 관련 로직을 추가하세요.
    }
}
