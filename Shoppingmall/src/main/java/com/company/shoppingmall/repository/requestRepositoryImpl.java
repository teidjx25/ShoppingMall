package com.company.shoppingmall.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shoppingmall.dto.requestDTO;
import com.company.shoppingmall.mapper.requestMapper;

@Repository
public class requestRepositoryImpl implements requestRepository{

	@Autowired
	private requestMapper requestMapper;
	
	@Override
	public void insert(requestDTO review) {
		requestMapper.insert(review);
		
	}

	@Override
	public List<requestDTO> list(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return requestMapper.list(hm);
	}

	@Override
	public requestDTO findByNum(int qnum) {
		// TODO Auto-generated method stub
		return requestMapper.findByNum(qnum);
	}

	@Override
	public void update(requestDTO board) {
		requestMapper.update(board);
		
	}

	@Override
	public void delete(int num) {
		requestMapper.delete(num);
		
	}

	@Override
	public int getCount(int pId) {
		// TODO Auto-generated method stub
		return requestMapper.getCount(pId);
	}

	@Override
	public int max() {
		// TODO Auto-generated method stub
		return requestMapper.max();
	}
	

}
