package com.example.demo.chat;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface ChatMapper {
    // 채팅 로그 저장
    void insertChatLog(ChatLogDTO chatLogDTO);

    // 특정 채팅방의 채팅 로그 리스트 가져오기
    List<ChatLogDTO> selectChatLogsByChatroomNo(@Param("chatroomNo") int chatroomNo);

    // 모든 채팅방 가져오기
    List<ChatRoomDTO> selectAllChatrooms();

    // 채팅방에 입장 메시지 전송
    void insertChatRoom(ChatRoomDTO chatRoomDTO);
}
