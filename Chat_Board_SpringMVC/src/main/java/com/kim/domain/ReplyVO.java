package com.kim.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;       // 댓글번호  pk번호
	private Long f_no;     //  댓글과 연결되는 fboard번호
	private String reply;   // 리플 내용
	private String replyer;  // 리플 작성자
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date replyDate;  // 리플 날짜
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateDate; // 리플 수정날짜
}
