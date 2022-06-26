package com.kim.service;

import java.util.List;

import com.kim.domain.MemberVO;

public interface MemberService {
	
	public void SignUp(MemberVO member);
	
	public int nickCheck(String m_nick);
	
	public MemberVO login(String m_nick, String m_pw);
	
	// 아이디 찾기
	public List<MemberVO> getIdList(String m_mail);
}
