package com.company.shoppingmall.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.company.shoppingmall.dto.reviewDTO;


public interface reviewMapper {
	//추가
	public void insert(reviewDTO review);
	//리스트
	public List<reviewDTO> list(HashMap<String , Object> hm);
	//상세보기
	public reviewDTO findByNum(int cnum);
	//수정
	public void update(reviewDTO board);
	//삭제
	public void delete(int cnum);
	
	public int getCount(int bnum);
	
	public int avgReview(int pId);
	

	
}
