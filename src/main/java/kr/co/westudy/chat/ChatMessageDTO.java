package kr.co.westudy.chat;


import lombok.Data;


@Data

public class ChatMessageDTO {
	private int chat_no;
	private String roomId;
	private String sendId;
	private String writer;
	private String message;
	private String datetime;
}