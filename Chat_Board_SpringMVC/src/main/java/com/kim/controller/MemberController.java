package com.kim.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
import com.kim.domain.MemberVO;
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
		
		String m_nick = member.getM_nick();
		String m_pw = member.getM_pw();
		
		if(service.login(m_nick, m_pw) == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
  		
		session.setAttribute("member", service.login(m_nick, m_pw));

		String checkId = request.getParameter("checkId");
		
		if(checkId != null) {
			CookieManager.makeCookie(response, "loginId", request.getParameter("m_nick"), 5000);
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
		
		System.out.println(member.toString());
		
		session.setAttribute("member", member);
		
		
	}
	
	// 아이디 찾기
	@GetMapping
	public void findId() {
		
	}
	
	@SuppressWarnings({ "unchecked", "null" })
	@PostMapping("/findId")
	@ResponseBody
	public void findId(@RequestBody String m_mail, HttpServletResponse response) throws IOException {
		
	//	System.out.println("여기는들어와지니" + m_mail.);
		
		List<String> list = new ArrayList<String>(); // json으로 변환하기위한 list
		
		List<MemberVO> alist = service.getIdList(m_mail); // db에서 꺼내온 MemberVO list
		
		
		for(int i=0; i< alist.size(); i++) {
			
			String m_nick = alist.get(i).getM_nick();

				list.add(m_nick);
		}
		
		  Gson gson = new Gson();
		
		  String result = gson.toJson(list);
		  
		  response.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html; charset=UTF-8");
		  response.getWriter().write(result);
		  
		 
		
	}
	
	
	
	
	
	
}
