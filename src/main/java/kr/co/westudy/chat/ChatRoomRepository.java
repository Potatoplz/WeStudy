package kr.co.westudy.chat;

import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import java.util.*;

@Repository
public class ChatRoomRepository {

    private Map<String, ChatRoomDTO> chatRoomDTOMap;

    @PostConstruct
    private void init(){
        chatRoomDTOMap = new LinkedHashMap<>();
    }

    public List<ChatRoomDTO> findAllRooms(){
        //채팅방 생성 순서 최근 순으로 반환
        List<ChatRoomDTO> result = new ArrayList<>(chatRoomDTOMap.values());
        Collections.reverse(result);

        return result;
    }

    public ChatRoomDTO findRoomById(String id){
    	System.out.println("id : "+id);
    	System.out.println(chatRoomDTOMap);
    	System.out.println("aasd"+chatRoomDTOMap.get(id));
        return chatRoomDTOMap.get(id);
    }

    public ChatRoomDTO createChatRoomDTO(String roomName){
    	ChatRoomDTO room = ChatRoomDTO.create(roomName);
        chatRoomDTOMap.put(room.getRoomId(), room);
        return room;
    }
}