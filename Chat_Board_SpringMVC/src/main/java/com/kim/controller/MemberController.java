package com.kim.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.kim.domain.MemberVO;
import com.kim.domain.ReplyVO;
import com.kim.service.MemberService;
import com.kim.utils.CookieManager;

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
		
		return "redirect:/member/login";
	 }
	 
	
	// 로그인
	@GetMapping("/login")
	public void login() {
		
	}
	
	// 로그인 post
	@PostMapping("/login")
	public String login(HttpServletResponse response, HttpServletRequest request, MemberVO member, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		
		if(service.login(member) == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		session.setAttribute("member", member);

		String checkId = request.getParameter("checkId");
		
		if(checkId != null) {
			CookieManager.makeCookie(response, "loginId", request.getParameter("m_nick"), 7);
		}
		else {
			CookieManager.deleteCookie(response, "loginId");
		}
		
		return "redirect:/fboard/list";
		
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logOut(HttpSession session) {
		
		session.removeAttribute("member");
		
		return "/member/login";
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
	
	// 카카오 로그인하기
	@ResponseBody
	@PostMapping(value="/kakaoLogin")
	public void kakaoLogin(HttpServletResponse response, HttpServletRequest request,@RequestBody MemberVO member){
	
		HttpSession session = request.getSession();
		
		session.setAttribute("member", member);
		
	}
	
	
	
	
	
}
