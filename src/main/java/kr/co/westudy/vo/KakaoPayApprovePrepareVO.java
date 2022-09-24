package kr.co.westudy.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayApprovePrepareVO {

	private String tid;
	private String partner_order_id;
	private String partner_user_id;
	private String pg_token;
	
	
	private String cafe_id;//카페번호
	private String item_name;//카페이름
	private String member_id;//회원번호
	private String member_nick;//닉네임
	private String use_date;//방문예정일
	private String use_start_time;//이용 시작시간
	private String use_end_time;//이용 종료시간
	private String reserve_count;//예약 시간
	private String room_id;//방번호
	private int total_amount;//결제금액
	
	private int reserve_id;//예약번호
	private String pay_state;//예약번호

	private String plan_year;
	private String plan_month;
	private String plan_date;
	
}
