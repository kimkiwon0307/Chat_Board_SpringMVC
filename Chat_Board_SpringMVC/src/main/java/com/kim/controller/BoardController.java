package com.kim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kim.domain.FboardVO;
import com.kim.domain.Criteria;
import com.kim.domain.PageDTO;
import com.kim.service.FboardService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/fboard/*")
@AllArgsConstructor
public class BoardController {

	private FboardService service;
	
	//전체목록 + 페이징
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		
		int total = service.getTotalCount(cri);
		
	//	model.addAttribute("list",service.getList());    // 목록
		model.addAttribute("list",service.getList(cri)); // 목록 + 페이징
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 화면처리에 사용할 PageDTO를 model에 저장
	}
	
	
	//등록하기 (GET)
	@GetMapping("/register")
	public void register() {};
	
	
	//등록하기
	@PostMapping("/register")
	public String register(FboardVO board, RedirectAttributes rttr) {
		service.register(board);
		System.out.println("Ggg" + board.toString());
		rttr.addFlashAttribute("result", board.getF_no());
		return "redirect:/fboard/list";
	}
	
	//조회하기 + 페이징
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("f_no")int f_no, Model model, @ModelAttribute("cri")Criteria cri) {
		model.addAttribute("board",service.get(f_no));
		
	}
	
	//수정하기
	@PostMapping("/modify")
	public String modify(FboardVO board, RedirectAttributes rttr) {
		
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/fboard/list";
	}
	
	//삭제하기
	@PostMapping("/remove")
	public String remove(@RequestParam("f_no")int f_no, RedirectAttributes rttr) {
		
		if(service.remove(f_no)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/fboard/list";
	}
}
