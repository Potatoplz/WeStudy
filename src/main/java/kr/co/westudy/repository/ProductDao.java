package kr.co.westudy.repository;

import java.util.List;

import kr.co.westudy.entity.ProductDto;

public interface ProductDao {
	//목록 기능
	List<ProductDto> list();
	//상세조회 기능
	ProductDto get(int no);
	//특정번호 조회 기능
	List<ProductDto> list(int[] no);
}