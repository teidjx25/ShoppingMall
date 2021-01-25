package com.company.shoppingmall.dto;

import java.util.Date;

import lombok.Data;


public class memberDTO {
	private String mId;
	private String mPassword;
	private String mTel;
	private String mEmail;
	private String mName;
	private String mAddress;
	private Date regdate;
	private String mClass;
	private int auth;
	private int mPoint;
	
	public int getmPoint() {
		return mPoint;
	}
	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getmClass() {
		return mClass;
	}
	public void setmClass(String mClass) {
		this.mClass = mClass;
	}
	@Override
	public String toString() {
		return "memberDTO [mId=" + mId + ", mPassword=" + mPassword + ", mTel=" + mTel + ", mEmail=" + mEmail
				+ ", mName=" + mName + ", mAddress=" + mAddress + ", regdate=" + regdate + ", mClass=" + mClass + "]";
	}
	
	
}
