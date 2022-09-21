package kr.co.westudy.chat;


import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.Data;

@Data
public class ChatRoomDTO {
    private String roomId;
    private String roomName;
    private Set<WebSocketSession> sessions = new HashSet<>();
    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션

    public static ChatRoomDTO create(String roomName){
    	ChatRoomDTO room = new ChatRoomDTO();
//        room.roomId = UUID.randomUUID().toString();//roomId 랜덤 생성
        room.roomId = roomName;
        room.roomName = roomName;
        return room;
    }
}