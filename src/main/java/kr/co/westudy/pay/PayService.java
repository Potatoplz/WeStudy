package kr.co.westudy.pay;

import java.net.URISyntaxException;

import kr.co.westudy.vo.KakaoPayApprovePrepareVO;
import kr.co.westudy.vo.KakaoPayApproveVO;
import kr.co.westudy.vo.KakaoPayCancelPrepareVO;
import kr.co.westudy.vo.KakaoPayCancelVO;
import kr.co.westudy.vo.KakaoPayReadyPrepareVO;
import kr.co.westudy.vo.KakaoPayReadyVO;
import kr.co.westudy.vo.KakaoPaySearchVO;

public interface PayService {
	//결제 준비 요청
		KakaoPayReadyVO ready(KakaoPayReadyPrepareVO kakaoPayReadyPrepareVO) throws URISyntaxException;
		//묶음 결제 준비 요청
		KakaoPayReadyVO ready2(KakaoPayReadyPrepareVO prepareVO) throws URISyntaxException;
		//결제 승인 요청
		KakaoPayApproveVO approve(KakaoPayApprovePrepareVO kakaoPayApprovePrepareVO) throws URISyntaxException;
		//결제 조회 기능
		KakaoPaySearchVO search(String tid) throws URISyntaxException;
		//결제 취소 기능
		KakaoPayCancelVO cancel(KakaoPayCancelPrepareVO prepareVO) throws URISyntaxException;

}