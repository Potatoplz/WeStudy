package kr.co.westudy.repository;

import java.util.List;

import kr.co.westudy.entity.PaymentDetailDto;

public interface PaymentDetailDao {
	void add(List<PaymentDetailDto> list);
	void addAll(List<PaymentDetailDto> list);
	List<PaymentDetailDto> get(int paymentDetailOrigin);
}