package com.company.shoppingmall.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;


public interface productMapper {
	//상품등록
	public void productInsert(ProductDTO product);
	//조회
	public List<ProductDTO> list(HashMap<String , Object> hm);
	
	//상세보기
	public ProductDTO findByNum(int pId);
	 
	//수정
	public void update(ProductDTO product);
	
	//삭제
	public void delete(int pId);
	
	//모든 물품 카운트
	public int getCount(HashMap<String, Object> hm);
	

	
	
	

}