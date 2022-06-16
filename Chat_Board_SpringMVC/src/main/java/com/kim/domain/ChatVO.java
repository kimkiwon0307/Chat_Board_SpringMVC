package com.kim.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {

	private int c_no;          // 게시물 번호
	private String c_title;    // 게시물 제목
	private String c_writer;   // 게시물 글쓴이
	private int c_count;       // 게시물 참여수
	private Date c_date;       // 게시물 날짜
}
