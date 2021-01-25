package com.company.shoppingmall.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class ProductDTO {
	private int pId;//
	private MultipartFile uploadFile;
	private String bimg;
	private String pName;//
	private int pPrice;//
	private int qQTY;//
	private int pBuyCnt;//
	private int pQTY;
	private String maker;//
	private Date regdate;//
	private int productType;//
	private int promotion;//
	private int category;//
	private int discount;//
	
	private String pContent;
	private String recomendC;
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getqQTY() {
		return qQTY;
	}
	public void setqQTY(int qQTY) {
		this.qQTY = qQTY;
	}
	public int getpBuyCnt() {
		return pBuyCnt;
	}
	public void setpBuyCnt(int pBuyCnt) {
		this.pBuyCnt = pBuyCnt;
	}
	public int getpQTY() {
		return pQTY;
	}
	public void setpQTY(int pQTY) {
		this.pQTY = pQTY;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getProductType() {
		return productType;
	}
	public void setProductType(int productType) {
		this.productType = productType;
	}
	public int getPromotion() {
		return promotion;
	}
	public void setPromotion(int promotion) {
		this.promotion = promotion;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getRecomendC() {
		return recomendC;
	}
	public void setRecomendC(String recomendC) {
		this.recomendC = recomendC;
	}
	@Override
	public String toString() {
		return "ProductDTO [pId=" + pId + ", uploadFile=" + uploadFile + ", bimg=" + bimg + ", pName=" + pName
				+ ", pPrice=" + pPrice + ", qQTY=" + qQTY + ", pBuyCnt=" + pBuyCnt + ", pQTY=" + pQTY + ", maker="
				+ maker + ", regdate=" + regdate + ", productType=" + productType + ", promotion=" + promotion
				+ ", category=" + category + ", discount=" + discount + ", pContent=" + pContent + ", recomendC="
				+ recomendC + "]";
	}
	
}