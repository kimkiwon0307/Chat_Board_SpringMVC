package com.kim.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	// 사용자 번호 기본키
	private Long m_no;
	
	// 사용비 비밀번호
	private String m_pw;
	
	// 사용자 닉네임
	private String m_nick;
	
	// 사용자 메일
	private String m_mail;
	
	// 관리자 구분 (관리자 : 0, 사용자 : 1)
	private int m_admin;
	
	// 사용자 가입날짜 
	private Date m_date;
}
