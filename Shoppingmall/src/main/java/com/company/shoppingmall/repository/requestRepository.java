package com.company.shoppingmall.repository;

import java.util.HashMap;
import java.util.List;

import com.company.shoppingmall.dto.requestDTO;

public interface requestRepository {
		//추가
		public void insert(requestDTO review);
		//리스트
		public List<requestDTO> list(HashMap<String , Object> hm);
		//상세보기
		public requestDTO findByNum(int num);
		//수정
		public void update(requestDTO board);
		//삭제
		public void delete(int num);
		
		public int getCount(int pId);
		public int max();
}
