package com.kim.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FboardVO {
	
	//게시판 번호
	private int f_no;

	//게시판 제목
	private String f_title;
	
	//게시판 내용
	private String f_content;
	
	//게시판 작성자
	private String f_writer;
	
	//게시판 등록날짜
	private Date f_date;
	
	//게시판 수정날짜
	private Date f_udate;
	
}


