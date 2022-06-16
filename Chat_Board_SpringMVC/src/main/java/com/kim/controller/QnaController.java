package com.kim.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kim.domain.Criteria;
import com.kim.domain.PageDTO;
import com.kim.domain.QnaVO;
import com.kim.service.QnaService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {

	private QnaService service;
	
	//전체목록 + 페이징
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		
		int total = service.getTotalCount();
		
		
	//	model.addAttribute("list",service.getList()); // 목록
		model.addAttribute("list",service.getList(cri)); // 목록 + 페이징
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 화면 처리에 필요
	}
	
	//등록하기 (GET)
	@GetMapping("/register")
	public void register() {};
	
	
	//등록하기
	@PostMapping("/register")
	public String register(QnaVO qvo, RedirectAttributes rttr) {
		
		service.register(qvo);
		rttr.addFlashAttribute("result", "1");
		return "redirect:/qna/list";
	}
	
	//조회하기 + 페이징
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("q_no")int q_no, Model model, @ModelAttribute("cri")Criteria cri, HttpServletRequest request) {
		
		// 요청 들어온 url을 구한다.
		StringBuffer url = request.getRequestURL();
		
		// url에 "get"이라는 문자열이 있으면 조회수를 증가한다. 이는 수정버튼을 눌렀을때 올라가는 조회수를 막기 위함이다.
		if(url.substring(37, 40).equalsIgnoreCase("get")) {
			service.update_count(q_no);
		}
		
		model.addAttribute("qvo",service.get(q_no));
	}
	
	//수정하기
	@PostMapping("/modify")
	public String modify(QnaVO qvo, RedirectAttributes rttr) {
		
		service.modify(qvo);
		rttr.addFlashAttribute("result","2");
		
		return "redirect:/qna/list";
	}
	
	//삭제하기
	@PostMapping("/remove")
	public String remove(@RequestParam("q_no")int q_no, RedirectAttributes rttr) {
		
		service.remove(q_no);
		rttr.addFlashAttribute("result", "3");
		
		return "redirect:/qna/list";
	}
	
	
	
	@GetMapping("/reply.no")
	public String reply(Model model, int q_no) {
		model.addAttribute("qvo", service.get(q_no));
		System.out.println("q번호는" + q_no);
		return "qna/reply";
	} //reply()

	@PostMapping("/reply_insert.no")
	public String reply_insert(QnaVO qvo) {
		
		service.reply_insert(qvo);

		return "redirect:/qna/list";
	} //reply_insert()
	
	
	

}

