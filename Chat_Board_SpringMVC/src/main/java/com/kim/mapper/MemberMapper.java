package com.kim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kim.domain.FboardVO;
import com.kim.domain.MemberVO;

public interface MemberMapper {
	
	// 회원가입
	public void SignUp(MemberVO member);
	
	// 닉네임 중복검사
	public int nickCheck(String m_nick);
	
	// 로그인
	public MemberVO Login(@Param("m_nick") String m_nick, @Param("m_pw") String m_pw);

	// 아이디 찾기
	public List<MemberVO> getIdList(String m_mail);
	
}
