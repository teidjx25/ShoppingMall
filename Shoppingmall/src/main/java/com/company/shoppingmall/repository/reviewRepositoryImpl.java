package com.company.shoppingmall.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shoppingmall.dto.reviewDTO;
import com.company.shoppingmall.mapper.reviewMapper;
@Repository
public class reviewRepositoryImpl implements reviewRepository{
	
	@Autowired
	private reviewMapper reviewMapper;
	
	@Override
	public void insert(reviewDTO review) {
		// TODO Auto-generated method stub
		reviewMapper.insert(review);
	}

	@Override
	public List<reviewDTO> list(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return reviewMapper.list(hm);
	}

	@Override
	public reviewDTO findByNum(int cnum) {
		// TODO Auto-generated method stub
		return reviewMapper.findByNum(cnum);
	}

	@Override
	public void update(reviewDTO board) {
		reviewMapper.update(board);
		
	}

	@Override
	public void delete(int cnum) {
		reviewMapper.delete(cnum);
		
	}

	@Override
	public int getCount(int bnum) {
		// TODO Auto-generated method stub
		return reviewMapper.getCount(bnum);
	}

	@Override
	public int avgReview(int num) {
		// TODO Auto-generated method stub
		return reviewMapper.avgReview(num);
	}



}
