package com.kim.mapper;

import com.kim.domain.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	public void SignUp(MemberVO member);
	
	// 닉네임 중복검사
	public int nickCheck(String m_nick);
	
}
