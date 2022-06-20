package com.kim.service;

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
		
		System.out.println("Serivce"+ member.toString());
		
		mapper.SignUp(member);
		
		System.out.println("Serivce2"+ member.toString());
	}

	// 닉네임 중복체크
	@Override
	public int nickCheck(String m_nick) {
		return mapper.nickCheck(m_nick);
	}

	// 로그인 
	@Override
	public MemberVO login(MemberVO member) {
		return mapper.Login(member);
	}

}
