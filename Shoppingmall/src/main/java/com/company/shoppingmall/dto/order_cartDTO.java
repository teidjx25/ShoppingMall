package com.company.shoppingmall.dto;

import java.util.Date;

import lombok.Data;


public class order_cartDTO {
	private int idcart;
	private String mId;
	private int pId;
	private String pName;
	private int cQTY; //주문량
	private int cTotalPrice; //총금액
	private Date oRegDate;
	

	private int pPrice;//
	private int pQTY;
	private int discount;//
	
	
	



	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpQTY() {
		return pQTY;
	}

	public void setpQTY(int pQTY) {
		this.pQTY = pQTY;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getIdcart() {
		return idcart;
	}

	public void setIdcart(int idcart) {
		this.idcart = idcart;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getcQTY() {
		return cQTY;
	}

	public void setcQTY(int cQTY) {
		this.cQTY = cQTY;
	}

	public int getcTotalPrice() {
		return cTotalPrice;
	}

	public void setcTotalPrice(int cTotalPrice) {
		this.cTotalPrice = cTotalPrice;
	}

	public Date getoRegDate() {
		return oRegDate;
	}

	public void setoRegDate(Date oRegDate) {
		this.oRegDate = oRegDate;
	}


	@Override
	public String toString() {
		return "order_cartDTO [idcart=" + idcart + ", mId=" + mId + ", pId=" + pId + ", pName=" + pName + ", cQTY="
				+ cQTY + ", cTotalPrice=" + cTotalPrice + ", oRegDate=" + oRegDate + ", pPrice=" + pPrice + ", pQTY="
				+ pQTY + ", discount=" + discount + "]";
	}
	
	
}
