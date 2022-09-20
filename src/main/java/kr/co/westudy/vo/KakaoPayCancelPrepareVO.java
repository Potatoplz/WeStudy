package kr.co.westudy.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPayCancelPrepareVO {
	private int paymentNo;
	private String tid;
	private int cancel_amount;
	private int cancel_tax_free_amount;
}