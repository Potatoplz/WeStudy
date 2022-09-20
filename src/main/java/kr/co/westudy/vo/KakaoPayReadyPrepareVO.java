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
	private String item_name;
	private int quantity;
	private int total_amount;
	private int tax_free_amount;
	
	//상품번호를 추가
	private int no;
	
	//다건 결제일 경우 결제 상품 내역을 저장
		private List<ChunkVO> chunk;
		private List<ProductDto> product;
}