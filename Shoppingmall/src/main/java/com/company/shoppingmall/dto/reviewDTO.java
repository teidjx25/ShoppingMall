package com.company.shoppingmall.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class reviewDTO {
	private int cnum;
	private int grade;
	private String name;
	private String comment;
	private int reRef;
	private int reLev;
	private int reSeq;
	private int bnum;
	private Date Rdate;
	private String reviewImg;
	private MultipartFile uploadFile;

}
