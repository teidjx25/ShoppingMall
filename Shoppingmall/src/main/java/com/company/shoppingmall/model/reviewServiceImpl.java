package com.company.shoppingmall.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.shoppingmall.dto.reviewDTO;
import com.company.shoppingmall.repository.reviewRepositoryImpl;
@Service
public class reviewServiceImpl implements reviewService {

	@Autowired
	private reviewRepositoryImpl reviewRepositoryImpl;
	
	@Override
	public void insert(reviewDTO review) {
		// TODO Auto-generated method stub
		reviewRepositoryImpl.insert(review);
	}

	@Override
	public List<reviewDTO> list(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return reviewRepositoryImpl.list(hm);
	}

	@Override
	public reviewDTO findByNum(int num) {
		// TODO Auto-generated method stub
		return reviewRepositoryImpl.findByNum(num);
	}

	@Override
	public void update(reviewDTO board) {
		reviewRepositoryImpl.update(board);

	}

	@Override
	public void delete(int num) {
		reviewRepositoryImpl.delete(num);

	}

	@Override
	public int getCount(int bnum) {
		// TODO Auto-generated method stub
		return reviewRepositoryImpl.getCount(bnum);
	}

	@Override
	public int avgReview(int num) {
		// TODO Auto-generated method stub
		return reviewRepositoryImpl.avgReview(num);
	}


}
