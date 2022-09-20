package kr.co.westudy.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayCardInfoVO {

	private String purchase_corp;
	private String purchase_corp_code;
	private String issuer_corp;
	private String issuer_corp_code;
	private String kakaopay_purchase_corp;
	private String kakaopay_purchase_corp_code;
	private String kakaopay_issuer_corp;
	private String kakaopay_issuer_corp_code;
	private String bin;
	private String card_type,install_month;
	private String approved_id;
	private String card_mid;
	private String interest_free_install;
	private String card_item_code;
	
	
}
