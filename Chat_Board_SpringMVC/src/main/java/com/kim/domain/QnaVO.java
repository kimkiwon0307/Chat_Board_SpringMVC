package com.kim.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Data
public class QnaVO {

	private int q_no;        // 게시물 번호
	private String q_title;  // 게시물 제목
	private String q_writer;  // 게시물 글쓴이
	private String q_content; // 게시물 내용
	private int q_count;      // 게시물 조회수
	private Date q_date;      // 게시물 날짜
	private Date q_udate;      // 게시글 수정날짜
	private String q_filename;   // 게시글 파일이름
	private String q_filepath;   // 게시글 파일경로

	private int q_root;          // 부모글 번호
	private int q_step;          // 원글 step + 1
	private int q_indent;        // 원글 indent + 1
	
	
}
