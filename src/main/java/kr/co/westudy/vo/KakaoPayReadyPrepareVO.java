package kr.co.westudy.vo;

import java.util.List;

import kr.co.westudy.entity.ProductDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//카카오 결제 준비 요청에 필요한 데이터
@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class KakaoPayReadyPrepareVO {
	private String partner_order_id;
	private String partner_user_id;
	private String item_name;//카페이름
	private int quantity;
	private int total_amount;
	private int tax_free_amount;//결제금액
	
	private String cafe_id;//카페번호
	private String member_id;//회원번호
	private String member_nick;//닉네임
	private String use_date;//방문예정일
	private String use_start_time;//이용 시작시간
	private String use_end_time;//이용 종료시간
	private String reserve_count;//예약 시간
	private String room_id;//방번호
	
	
	
	//상품번호를 추가
	private int no;
	
	//다건 결제일 경우 결제 상품 내역을 저장
		private List<ChunkVO> chunk;
		private List<ProductDto> product;
}