package com.company.shoppingmall.mapper;


import java.util.HashMap;
import java.util.List;


import com.company.shoppingmall.dto.orderDTO;


public interface orderMapper {
	//추가
	public int insert(orderDTO order);
	
	//조회
	public List<orderDTO> buyList(HashMap<String, Object> hm);
	
	//수정
	public void update(orderDTO order);

	//구매 조회
	public List<orderDTO> buyList();
	
	//구매 수정
	public void buyUpdate(orderDTO order);
	
	//구매 카운트
	public int buyCount(String buyId);
	//구매 합계
	public int sumCount(String buyId);
	
	//구매 상세
	public orderDTO OfindByNum(int num);
}
