package com.company.shoppingmall.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shoppingmall.dto.memberDTO;
import com.company.shoppingmall.mapper.memberMapper;
@Repository
public class memberRepositoryImpl implements memberRepository {
	@Autowired
	private memberMapper memberMapper;
	
	@Override
	public void insert(memberDTO member) {
		memberMapper.insert(member);

	}

	@Override
	public memberDTO findById(String id) {
		// TODO Auto-generated method stub
		return memberMapper.findById(id);
	}

	@Override
	public void update(memberDTO member) {
		memberMapper.update(member);

	}

	@Override
	public void delete(String id) {
		memberMapper.delete(id);

	}

	@Override
	public memberDTO idCheck(String id) {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(id);
	}

	@Override
	public memberDTO loginCheck(String id) {
		// TODO Auto-generated method stub
		return memberMapper.loginCheck(id);
	}

}
