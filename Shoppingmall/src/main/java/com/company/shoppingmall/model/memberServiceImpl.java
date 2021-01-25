package com.company.shoppingmall.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.shoppingmall.dto.memberDTO;
import com.company.shoppingmall.repository.memberRepositoryImpl;

@Service
public class memberServiceImpl implements memberService {
	
	@Autowired
	private memberRepositoryImpl memberRepositoryImpl;
	
	@Override
	public void insert(memberDTO member) {
		// TODO Auto-generated method stub
		memberRepositoryImpl.insert(member);
	}

	@Override
	public memberDTO findById(String id) {
		// TODO Auto-generated method stub
		return memberRepositoryImpl.findById(id);
	}

	@Override
	public void update(memberDTO member) {
		memberRepositoryImpl.update(member);

	}

	@Override
	public void delete(String id) {
		memberRepositoryImpl.delete(id);

	}

	@Override
	public memberDTO idCheck(String id) {
		// TODO Auto-generated method stub
		return memberRepositoryImpl.idCheck(id);
	}

	@Override
	public memberDTO loginCheck(String id) {
		// TODO Auto-generated method stub
		return memberRepositoryImpl.loginCheck(id);
	}

}
