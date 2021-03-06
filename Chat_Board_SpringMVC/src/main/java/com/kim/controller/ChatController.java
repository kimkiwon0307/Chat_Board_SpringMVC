package com.kim.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kim.domain.ChatRoomVO;

@Controller
@RequestMapping("/chatting/*")
public class ChatController {

	
	ArrayList<ChatRoomVO> chatRoomList = new ArrayList<ChatRoomVO>();
	Map<String, ChatRoomVO> chatRoomMap = new LinkedHashMap<String, ChatRoomVO>(); // LinkedHashMap : 중복을 허용하지 않으며 순서대로 저장
	

	@GetMapping("/chat")
	public void chat(Model model,String r_no) {
		chatRoomMap.get(r_no);
		model.addAttribute("chatRoomMap", chatRoomMap.get(r_no));
		
	}

	@GetMapping("/list")
	public void list(Model model, HttpSession session) {
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("chatRoomMap", chatRoomMap);
	}
 
	@PostMapping("/register")
	@ResponseBody
	public void create(HttpServletRequest request,ChatRoomVO room) {
		
		System.out.println(room.getR_no());
		
		chatRoomMap.put(room.getR_no(), room);
		
		chatRoomList.add(room);
		
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public void delete(HttpServletRequest request,ChatRoomVO room) {
		
		System.out.println(room.toString());
		
		chatRoomMap.remove(room.getR_no());
		
	}
	
}
