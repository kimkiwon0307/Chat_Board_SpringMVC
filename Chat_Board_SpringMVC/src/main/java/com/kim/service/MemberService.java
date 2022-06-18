package com.kim.service;

import com.kim.domain.MemberVO;

public interface MemberService {
	
	public void SignUp(MemberVO member);
	
	public int nickCheck(String m_nick);
}
