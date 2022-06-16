package com.kim.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage; //페이징 시작번호
	private int endPage;  // 페이징 끝번호
	private boolean prev, next; // 이전, 이후
	
	private int total;  // 게시글 갯수
	private Criteria cri; //  페이지번호랑 ,총갯수 
	
	
	// 생성자
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage =(int)(Math.ceil(cri.getPageNum()/10.0)) * 10; // endPage 계산식
		this.startPage = this.endPage - 9; // 10개씩이라는 가정하에 - 9
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount())); // 진짜 endPage 구하기식
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}

