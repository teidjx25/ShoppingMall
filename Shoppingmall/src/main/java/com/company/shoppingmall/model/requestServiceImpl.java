package com.company.shoppingmall.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.shoppingmall.dto.requestDTO;
import com.company.shoppingmall.repository.requestRepositoryImpl;
@Service
public class requestServiceImpl implements requestService {

	@Autowired
	private requestRepositoryImpl requestRepositoryImpl;
	
	@Override
	public void insert(requestDTO review) {
		requestRepositoryImpl.insert(review);

	}

	@Override
	public List<requestDTO> list(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return requestRepositoryImpl.list(hm);
	}

	@Override
	public requestDTO findByNum(int qnum) {
		// TODO Auto-generated method stub
		return requestRepositoryImpl.findByNum(qnum);
	}

	@Override
	public void update(requestDTO request) {
		requestRepositoryImpl.update(request);

	}

	@Override
	public void delete(int num) {
		requestRepositoryImpl.delete(num);

	}

	@Override
	public int getCount(int pId) {
		// TODO Auto-generated method stub
		return requestRepositoryImpl.getCount(pId);
	}

	@Override
	public int max() {
		// TODO Auto-generated method stub
		return requestRepositoryImpl.max();
	}

}
