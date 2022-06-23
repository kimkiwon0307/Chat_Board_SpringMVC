package com.kim.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kim.domain.ReplyVO;
import com.kim.service.ReplyService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/replies/*")
@AllArgsConstructor
public class ReplyController {

	// 의존 객체
	private ReplyService service;
	
	
	// 댓글 등록하기
	@ResponseBody
	@PostMapping(value="/new")
	public void create(@RequestBody ReplyVO reply){
		
		service.register(reply);
	}
	
	// 댓글 목록가져오기
	@GetMapping(value= "/{f_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE } )
	public List<ReplyVO> list(@PathVariable("f_no")Long f_no){
		
		return service.getList(f_no);
	}
	
	// 댓글 수정
	@GetMapping("/{rno}")
	public void get(@PathVariable("rno")Long rno) {
		service.get(rno);

	}
	
	@GetMapping(value="/replyDelete")
	public String replyDelete(Long rno) {
	   
		int result = service.remove(rno);
		
	    String message=null;

	    if(result==1) {
	        message = "success";
	    }else {
	        message ="fail";
	    }	
	    return message;
	}
	
	@PostMapping(value="/replyUpdate")
	public void replyUpdate(ReplyVO reply) {
	
		System.out.println(reply.toString());
		
		service.modify(reply);
	
	}
	
	
}
