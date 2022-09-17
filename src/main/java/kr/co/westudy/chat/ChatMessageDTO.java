package kr.co.westudy.chat;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ChatMessageDTO {
	private int chat_no;
	private String roomId;
	private String sendId;
	private String writer;
	private String message;
}