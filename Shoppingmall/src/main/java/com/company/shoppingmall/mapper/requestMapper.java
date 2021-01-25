package com.company.shoppingmall.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.company.shoppingmall.dto.requestDTO;


public interface requestMapper {
	//추가
	public void insert(requestDTO review);
	//리스트
	public List<requestDTO> list(HashMap<String , Object> hm);
	//상세보기
	public requestDTO findByNum(int qnum);
	//수정
	public void update(requestDTO board);
	//삭제
	public void delete(int qnum);
	
	public int getCount(int pId);
	
	public int max();
}
