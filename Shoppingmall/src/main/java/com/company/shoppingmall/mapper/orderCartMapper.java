package com.company.shoppingmall.mapper;


import java.util.HashMap;
import java.util.List;


import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;


public interface orderCartMapper {
	
	//장바구니 저장
	public void cartProduct(order_cartDTO orderCart);
	//장바구니 리스트
	public List<order_cartDTO> cartList(HashMap<String, Object> hm);
	//장바구니 조회
	public order_cartDTO findbyMember(order_cartDTO orderCart);
	
	//장바구니 수정
	public void cartUpdate(order_cartDTO orderCart);
	//장바구니 삭제
	public void cartDeleteOne(order_cartDTO orderCart);
	//장바구니 전체삭제
	public void cartDeleteAll(order_cartDTO orderCart);
	//장바구니 카운트
	public int cartCount(String mId);
	//장바구니 모든 가격
	public int cartCount(int mID);

	
	//장바구니 합계
	public int sumCart(String buyId);
}
