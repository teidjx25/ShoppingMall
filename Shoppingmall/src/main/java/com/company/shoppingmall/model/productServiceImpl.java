package com.company.shoppingmall.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.shoppingmall.dto.ProductDTO;
import com.company.shoppingmall.dto.orderDTO;
import com.company.shoppingmall.dto.order_cartDTO;
import com.company.shoppingmall.repository.productRepositoryImpl;

@Service
public class productServiceImpl implements productService {

	@Autowired
	private productRepositoryImpl productRepositoryImpl;
	
	@Override
	public void productInsert(ProductDTO product) {
		productRepositoryImpl.productInsert(product);

	}

	@Override
	public List<ProductDTO> list(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.list(hm);
	} 

	@Override
	public ProductDTO findByNum(int pId) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.findByNum(pId);
	}

	@Override
	public void update(ProductDTO product) {
		productRepositoryImpl.update(product);
	}

	@Override
	public void delete(int pId) {
		productRepositoryImpl.delete(pId);

	}

	@Override
	public int getCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.getCount(hm);
	}

	@Override
	public void buyProduct(orderDTO order) {
		// TODO Auto-generated method stub
		productRepositoryImpl.buyProduct(order);
	}

	@Override
	public void cartProduct(order_cartDTO order) {
		// TODO Auto-generated method stub
		productRepositoryImpl.cartProduct(order);
	}

	@Override
	public List<orderDTO> buyList(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.buyList(hm);
	}

	@Override
	public void buyUpdate(orderDTO order) {
		// TODO Auto-generated method stub
		productRepositoryImpl.buyUpdate(order);
	}

	@Override
	public int buyCount(String buyId) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.buyCount(buyId);
	}

	@Override
	public int sumCount(String buyId) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.sumCount(buyId);
	}

	@Override
	public orderDTO OfindByNum(int num) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.OfindByNum(num);
	}

	@Override
	public List<order_cartDTO> cartList(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.cartList(hm);
	}

	@Override
	public order_cartDTO findbyMember(order_cartDTO orderCart) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.findbyMember(orderCart);
	}

	@Override
	public void cartUpdate(order_cartDTO orderCart) {
		// TODO Auto-generated method stub
		productRepositoryImpl.cartUpdate(orderCart);
	}

	@Override
	public void cartDeleteOne(order_cartDTO orderCart) {
		// TODO Auto-generated method stub
		productRepositoryImpl.cartDeleteOne(orderCart);
	}

	@Override
	public void cartDeleteAll(order_cartDTO orderCart) {
		// TODO Auto-generated method stub
		productRepositoryImpl.cartDeleteAll(orderCart);
	}

	@Override
	public int cartCount(String buyId) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.cartCount(buyId);
	}

	@Override
	public int sumCart(String buyId) {
		// TODO Auto-generated method stub
		return productRepositoryImpl.sumCart(buyId);
	}

}
