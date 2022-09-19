package kr.co.westudy.chat;

import java.text.DateFormat;
import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template; // 특정 Broker로 메세지를 전달

	/* @MessageMapping을 통해 WebSocket으로 들어오는 메시지 발행을 처리 한다.
	 * Client에서는 prefix를 붙여 "/pub/chat/enter*로 발행 요청을 하면 Controller가 해당 메시지를 받아 처리하는데,
	 * 메시지가 발행되면 "/sub/chat/room/[roomId]"로 메시지가 전송된다. 
	 * Client에서는 해당 주소를 Subscribe하고 있다가, 메시지가 전달되면 화면에 출력한다.
	 * 이때 "/sub/chat/room/[roomId]"는 채팅방을 구분하는 값이다. */
	
	/* 
		Client가 SEND할 수 있는 경로
		Config에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
		"/pub/chat/enter"
	*/
	
	@MessageMapping(value = "/chat/enter")
	public void enter(ChatMessageDTO message) {
		/* 입장 메시지 */
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.DATE_FIELD, DateFormat.DATE_FIELD);
		String formattedDate = dateFormat.format(date);
		message.setMessage(formattedDate + " " + "[" +message.getSendId()+ "]" + " 님 입장");
		template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
	}

	//[채팅방 고유번호와 join해서 해당 채팅방에 보낸 사람, 보낸 메시지 DB연동]
	@MessageMapping(value = "/chat/message")
	public void message(ChatMessageDTO message) {
		template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
		System.out.println("채팅방 고유번호 : " + message.getRoomId());
		System.out.println("보낸 사람 : " + message.getSendId());
		System.out.println("보낸 메시지 : " + message.getMessage());
		
	}
}