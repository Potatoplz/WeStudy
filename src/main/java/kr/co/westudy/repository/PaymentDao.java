package kr.co.westudy.repository;

import java.util.List;

import kr.co.westudy.entity.PaymentDto;

public interface PaymentDao {
	int getSequence();
	void ready(PaymentDto paymentDto);
	void approve(int paymentNo);
	List<PaymentDto> list(int paymentBuyer);
	PaymentDto get(int paymentNo);
	void cancel(int paymentNo);
}