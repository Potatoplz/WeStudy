package kr.co.westudy.pay;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.vo.KakaoPayApprovePrepareVO;


@Repository
public class PayDAO {

    @Autowired
    private SqlSession sqlSession;

    
    public int reserve(KakaoPayApprovePrepareVO prepareVO) {
        int successCount = 0;
        successCount = sqlSession.insert("PayMapper.reserve", prepareVO);
        return successCount;
    }// 예약 DB 입력

    public int pay(KakaoPayApprovePrepareVO prepareVO) {
        int successCount = 0;
        successCount = sqlSession.insert("PayMapper.pay", prepareVO);
        return successCount;
    }// 결제 DB 입력
    
    public int calInsert(KakaoPayApprovePrepareVO prepareVO) {
        int calCount = 0;
        calCount = sqlSession.insert("PayMapper.calInsert", prepareVO);
        return calCount;
    }// 달력 DB 입력

}
