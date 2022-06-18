package com.kim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.domain.MemberVO;
import com.kim.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	//의존객체 서비스
	@Autowired
	private MemberService service;
	
	
	// 회원가입
	@GetMapping("/signUp")
	public void signUp() {}
	
	
	
	// 회원가입
	@PostMapping("/signUp") 
	public String signUp(MemberVO member) {
		System.out.println("hi"+member.toString());
		
		service.SignUp(member);
		
		return "redirect:/fboard/list";
	 }
	 
	
	// 로그인
	@GetMapping("/signIn")
	public void signIn() {
		
	}
	

	//닉네임 중복 체크
	@PostMapping("/m_nick_check")
	@ResponseBody
	public String m_nick_check(String m_nick) {
		
		if(m_nick.equals("")) {
			return "fail";
		}
		
		int result = service.nickCheck(m_nick);
		
		if(result !=0 ) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	
	
}
