package com.company.shoppingmall.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.company.shoppingmall.dto.memberDTO;

public interface memberMapper {
	
	//추가
	public void insert(memberDTO member);
	//상세보기
	public memberDTO findById(String id);
	//수정
	public void update(memberDTO member);
	//삭제
	public void delete(String id);
	//아이디중복확인
	public memberDTO idCheck(String id);
	//로그인체크
	public memberDTO loginCheck(String id);
}