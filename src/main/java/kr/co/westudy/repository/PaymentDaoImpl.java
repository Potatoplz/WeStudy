package kr.co.westudy.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.entity.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getSequence() {
		return sqlSession.selectOne("payment.sequence");
	}
	
	@Override
	public void ready(PaymentDto paymentDto) {
		sqlSession.insert("payment.ready", paymentDto);
	}
	
	@Override
	public void approve(int paymentNo) {
		sqlSession.update("payment.approve",paymentNo);
	}
	
	@Override
	public List<PaymentDto> list(int paymentBuyer) {
		return sqlSession.selectList("payment.list", paymentBuyer);
	}
	
	@Override
	public PaymentDto get(int paymentNo) {
		return sqlSession.selectOne("payment.get", paymentNo);
	}
	
	@Override
	public void cancel(int paymentNo) {
		sqlSession.update("payment.cancel", paymentNo);
	}
}
