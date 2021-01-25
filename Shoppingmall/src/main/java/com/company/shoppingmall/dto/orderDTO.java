package com.company.shoppingmall.dto;

import java.util.Date;

import lombok.Data;

@Data
public class orderDTO {
	private int idbuyProduct;
	
	private int buyPN; //상품의 아이디	
	private int buyCheck;	//구매 확인 7
	private int buyNum; //구매하는 갯수
	
	private int totalPrice;	//구매 전체금액
	
	
	private String buyId;	//구매자 아이디	2
	private String buyName;	//구매자 이름	3
	private String buyAddress;	//구매 주소	4
	private String buyTel;		//구매 전화번호 5
	
	private String buyCode;	//택배코드

	
	private Date regDate;	//6
	
}
