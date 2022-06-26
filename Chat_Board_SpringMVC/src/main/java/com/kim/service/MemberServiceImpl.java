package com.kim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kim.domain.MemberVO;
import com.kim.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{

	// 의존객체
	private MemberMapper mapper;
	
	// 회원가입
	@Override
	public void SignUp(MemberVO member) {
		mapper.SignUp(member);
	}

	// 닉네임 중복체크
	@Override
	public int nickCheck(String m_nick) {
		return mapper.nickCheck(m_nick);
	}

	// 로그인 
	@Override
	public MemberVO login(String m_nick, String m_pw) {
		return mapper.Login(m_nick, m_pw);
	}

	//아이디 찾기
	@Override
	public List<MemberVO> getIdList(String m_mail) {
		return mapper.getIdList(m_mail);
	}

}
