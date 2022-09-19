package kr.co.westudy.util.dto;

import lombok.Data;

@Data
public class MemberDTO {

	private String member_id;
	private String member_email;
	private String member_pwd;
	private String member_nick;
	private String member_phone;
	
	private String email_agree;
	private String sms_agree;
	private String admin_yn;
	
	private String join_route;
	private String account_on;

}