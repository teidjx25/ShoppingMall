package com.company.shoppingmall.dto;

import lombok.Data;

@Data
public class PageDTO {
	private int totalCount; // 전체 글갯수
	private int pageCount; // 총 필요한 페이지 수(마지막 페이지 번호)
	private int pageBlock;	// 한 페이지 당 표시되는 페이지의 수
	private int startPage;	// 페이지블록 내에서 시작페이지 번호
	private int endPage;	// 페이지블록 내에서 끝페이지 번호
	private int PageNum;
}