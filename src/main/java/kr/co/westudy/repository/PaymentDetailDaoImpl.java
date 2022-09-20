package kr.co.westudy.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.entity.PaymentDetailDto;

@Repository
public class PaymentDetailDaoImpl implements PaymentDetailDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void add(List<PaymentDetailDto> list) {
		for(PaymentDetailDto paymentDetailDto : list) {
			sqlSession.insert("paymentDetail.add", paymentDetailDto);
		}
	}
	
	@Override
	public void addAll(List<PaymentDetailDto> list) {
		Map<String, Object> param= new HashMap<>();
		param.put("list", list);
		sqlSession.insert("paymentDetail.addAll", param);
	}
	
	@Override
	public List<PaymentDetailDto> get(int paymentDetailOrigin) {
		return sqlSession.selectList("paymentDetail.get", paymentDetailOrigin);
	}
	
}