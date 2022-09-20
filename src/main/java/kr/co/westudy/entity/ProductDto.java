package kr.co.westudy.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ProductDto {
	private int no;
	private String name;
	private String type;
	private int price;
	private String made;
	private String expire;
}