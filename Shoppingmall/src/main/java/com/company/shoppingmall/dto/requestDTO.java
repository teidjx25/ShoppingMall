package com.company.shoppingmall.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


public class requestDTO {
	private int qnum;
	private String title;
	private String name;
	private String password;
	private String category;
	private int reRef;
	private int reLev;
	private int reSeq;
	private int bnum;
	private int state;
	private String contents;
	
	private Date qRdate;
	private MultipartFile uploadFile;
	private String requestImg;
	
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getReRef() {
		return reRef;
	}
	public void setReRef(int reRef) {
		this.reRef = reRef;
	}
	public int getReLev() {
		return reLev;
	}
	public void setReLev(int reLev) {
		this.reLev = reLev;
	}
	public int getReSeq() {
		return reSeq;
	}
	public void setReSeq(int reSeq) {
		this.reSeq = reSeq;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getqRdate() {
		return qRdate;
	}
	public void setqRdate(Date qRdate) {
		this.qRdate = qRdate;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getRequestImg() {
		return requestImg;
	}
	public void setRequestImg(String requestImg) {
		this.requestImg = requestImg;
	}
	@Override
	public String toString() {
		return "requestDTO [qnum=" + qnum + ", title=" + title + ", name=" + name + ", password=" + password
				+ ", category=" + category + ", reRef=" + reRef + ", reLev=" + reLev + ", reSeq=" + reSeq + ", bnum="
				+ bnum + ", state=" + state + ", contents=" + contents + ", qRdate=" + qRdate + ", uploadFile="
				+ uploadFile + ", requestImg=" + requestImg + "]";
	}
	
}
