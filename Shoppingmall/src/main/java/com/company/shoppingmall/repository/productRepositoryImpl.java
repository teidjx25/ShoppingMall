package com.company.shoppingmall.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;
import com.company.shoppingmall.mapper.orderCartMapper;
import com.company.shoppingmall.mapper.orderMapper;
import com.company.shoppingmall.mapper.productMapper;

@Repository
public class productRepositoryImpl implements productRepository{

	@Autowired
	private productMapper productMapper;
	
	@Autowired
	private orderMapper orderMapper;
	@Autowired
	private orderCartMapper orderCartMapper;
	
	@Override
	public void productInsert(ProductDTO product) {
		productMapper.productInsert(product);
		
	}

	@Override
	public List<ProductDTO> list(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub

			return productMapper.list(hm);
	}

	@Override
	public ProductDTO findByNum(int pId) {
		// TODO Auto-generated method stub
		return productMapper.findByNum(pId);
	}
	@Override
	public void update(ProductDTO product) {
		productMapper.update(product);
		
	}

	@Override
	public void delete(int pId) {
		productMapper.delete(pId);
		
	}

	@Override
	public int getCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productMapper.getCount(hm);
	}

	@Override
	public void buyProduct(orderDTO order) {
		// TODO Auto-generated method stub
		 orderMapper.insert(order);
	}

	@Override
	public void cartProduct(order_cartDTO order) {
		// TODO Auto-generated method stub
		orderCartMapper.cartProduct(order);
	}

	@Override
	public List<orderDTO> buyList(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return orderMapper.buyList(hm);
	}

	@Override
	public void buyUpdate(orderDTO order) {
		// TODO Auto-generated method stub
		orderMapper.buyUpdate(order);
	}

	@Override
	public int buyCount(String buyId) {
		// TODO Auto-generated method stub
		return orderMapper.buyCount(buyId);
	}

	@Override
	public int sumCount(String buyId) {
		// TODO Auto-generated method stub
		return orderMapper.sumCount(buyId);
	}

	@Override
	public orderDTO OfindByNum(int num) {
		// TODO Auto-generated method stub
		return orderMapper.OfindByNum(num);
	}

	@Override
	public List<order_cartDTO> cartList(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return orderCartMapper.cartList(hm);
	}

	@Override
	public order_cartDTO findbyMember(order_cartDTO orderCart) {
		// TODO Auto-generated method stub
		return orderCartMapper.findbyMember(orderCart);
	}

	@Override
	public void cartUpdate(order_cartDTO orderCart) {
		// TODO Auto-generated method stub
		orderCartMapper.cartUpdate(orderCart);
	}

	
	
	




	
}
