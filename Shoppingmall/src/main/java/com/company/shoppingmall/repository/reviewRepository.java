package com.company.shoppingmall.repository;

import java.util.HashMap;
import java.util.List;

import com.company.shoppingmall.dto.reviewDTO;

public interface reviewRepository {
		//추가
		public void insert(reviewDTO review);
		//리스트
		public List<reviewDTO> list(HashMap<String , Object> hm);
		//상세보기
		public reviewDTO findByNum(int num);
		//수정
		public void update(reviewDTO board);
		//삭제
		public void delete(int num);
		
		public int getCount(int bnum);

		public int avgReview(int num);
		
}
