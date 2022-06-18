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

	@Override
	public int nickCheck(String m_nick) {
		return mapper.nickCheck(m_nick);
	}

}
