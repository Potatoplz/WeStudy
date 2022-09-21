package kr.co.westudy.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.vo.KakaoPayApprovePrepareVO;


@Service
public class PayService1 {

    @Autowired
    private PayDAO dao;

   
    public int reserve(KakaoPayApprovePrepareVO prepareVO) {
    	int successCount = 0;
    	successCount = dao.reserve(prepareVO);
    	
    	if (successCount < 1) {
    		return successCount;
    	}
    	successCount = dao.pay(prepareVO);
    	return successCount;
    }// 예약 및 결제 DB 입력
}//class