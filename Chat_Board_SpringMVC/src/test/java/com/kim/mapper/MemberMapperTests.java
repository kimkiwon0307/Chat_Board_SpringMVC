package com.kim.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kim.domain.MemberVO;

import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
/*	
	@Test
	public void SignUp() {
		
		MemberVO member = new MemberVO();
		
		member.setM_mail("lion@naver.com");
		member.setM_nick("사자");
		member.setM_pw("11111");
		
		mapper.SignUp(member);
		
		System.out.println(member.toString());
	}
*/	
	@Test
	public void nickCheck() {
		
		String nick1 = "호랑이"; // 없는 닉네임 반환값 0
		String nick2 = "라이거"; // 있는 닉네임 반환값 1
		
		mapper.nickCheck(nick1);
		mapper.nickCheck(nick2);
		
	}
	
	@Test
	public void login() {
		
		MemberVO member = new MemberVO();
		
		String nick ="라이거";
		String pw = "111";
	//	String pw = "121"; 비밀번호 틀린경우
		
		member.setM_nick(nick);
		member.setM_pw(pw);
		
		mapper.Login(member);
		
		System.out.println(mapper.Login(member));
		
	}
}
