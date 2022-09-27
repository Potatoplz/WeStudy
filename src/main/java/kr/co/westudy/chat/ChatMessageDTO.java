package kr.co.westudy.chat;


import lombok.Data;


@Data

public class ChatMessageDTO {
	private String roomId;
	private String sendId;
	private String message;
	private String datetime;
}