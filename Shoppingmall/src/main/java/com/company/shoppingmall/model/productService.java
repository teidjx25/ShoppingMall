package com.company.shoppingmall.model;

import java.util.HashMap;
import java.util.List;

import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;



public interface productService {
	
		//상품등록
		public void productInsert(ProductDTO product);
		//조회
		public List<ProductDTO> list(HashMap<String , Object> hm);
		//상세보기
		public ProductDTO findByNum(int num);
		//수정
		public void update(ProductDTO product);
		//삭제
		public void delete(int num);
		//모든 물품 카운트
		public int getCount(HashMap<String, Object> hm);
		
		
		
		//구매
		public void buyProduct(orderDTO order);
		//구매 조회
		public List<orderDTO> buyList(HashMap<String, Object> hm);
		//구매 수정
		public void buyUpdate(orderDTO order);
		//구매 카운트
		public int buyCount(String buyId);
		//구매 상세
		public orderDTO OfindByNum(int num);
		//구매 합계
		public int sumCount(String buyId);
		
		
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
		public int cartCount(String buyId);
		//장바구니 합계
		public int sumCart(String buyId);
		
	
}
