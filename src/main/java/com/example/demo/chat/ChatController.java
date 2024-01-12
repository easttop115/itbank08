package com.example.demo.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Controller
public class ChatController {

    @Autowired
    private ChatService service; // ChatService는 채팅 로직을 처리하는 서비스 클래스입니다.

    @GetMapping("/chat/chatModal")
    public String chatView(Model model) {
        List<ChatRoomDTO> chatroomList = service.getAllChatrooms(); // 모든 채팅방 목록을 가져옵니다.
        model.addAttribute("chatroomList", chatroomList);
        return "chat/chatModal"; // chatModal.jsp로 이동
    }

    // 메시지 전송 로직
    @MessageMapping("/chat/{roomId}/sendMessage")
    public void sendMessage(@DestinationVariable String roomId, @Payload ChatLogDTO chatLogDTO) {
        service.saveChatLog(chatLogDTO); // 채팅 로그를 저장합니다.
        service.sendMessageToRoom(roomId,
                new ChatRoomDTO(ChatRoomDTO.MessageType.TALK, roomId, chatLogDTO.getUserId(), chatLogDTO.getMessage()));
    }

    // 입장 로직
    @MessageMapping("/chat/{roomId}/enter")
    public void enterRoom(@DestinationVariable String roomId, @Payload ChatRoomDTO chatRoomDTO,
            SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().put("roomId", roomId); // WebSocket 세션에 roomId를 저장합니다.
        service.sendMessageToRoom(roomId, chatRoomDTO); // 입장 메시지를 전송합니다.
    }

    // 퇴장 로직
    @MessageMapping("/chat/{roomId}/exit")
    public void exitRoom(@DestinationVariable String roomId, @Payload ChatRoomDTO chatRoomDTO,
            SimpMessageHeaderAccessor headerAccessor) {
        headerAccessor.getSessionAttributes().remove("roomId"); // WebSocket 세션에서 roomId를 제거합니다.
        service.sendMessageToRoom(roomId, chatRoomDTO); // 퇴장 메시지를 전송합니다.
    }

}
