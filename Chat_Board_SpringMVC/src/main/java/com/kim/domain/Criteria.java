package com.kim.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;  //페이지 번호
	private int amount;   // 한페이지당 보여줄 갯수
	
	private String type;  //검색에 사용할 검색타입
	private String keyword; //검색에 사용할 키워드
	
	
	// 기본 생성자  : 페지번호 1, 한페이지당 보여줄 갯수 10개로 기본값 정의
	public Criteria() {
		this(1,10);
	}
	
	// pageNum과 amount를 받는 생성자
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum; // 페이지 번호
		this.amount = amount;  // 한페이지당 보여줄 갯수
	}
	
	// Mybatis 동적 sql에서 사용할 메서드 // 3항 연산자 // type이 null이면 String[]을 만들고 null이 아니면 type을""로 잘라라
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
 
}


