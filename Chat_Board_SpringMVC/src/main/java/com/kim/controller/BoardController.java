package com.kim.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.kim.domain.Criteria;
import com.kim.domain.FboardVO;
import com.kim.domain.PageDTO;
import com.kim.service.FboardService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/fboard/*")
@AllArgsConstructor
public class BoardController {

	private FboardService service;

	// 전체목록 + 페이징
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {

		int total = service.getTotalCount(cri);
		
		System.out.println(service.getList(cri).toString());
		
		// model.addAttribute("list",service.getList()); // 목록
		model.addAttribute("list", service.getList(cri)); // 목록 + 페이징
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 페이징 화면처리에 사용할 PageDTO를 model에 저장
	}

	// 등록하기 (GET)
	@GetMapping("/register")
	public void register() {
	};

	// 등록하기
	@PostMapping("/register")
	public String register(FboardVO board, RedirectAttributes rttr) {
		service.register(board);
		System.out.println("Ggg" + board.toString());
		rttr.addFlashAttribute("result", board.getF_no());
		return "redirect:/fboard/list";
	}

	// 조회하기 + 페이징
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("f_no") int f_no, Model model, @ModelAttribute("cri") Criteria cri) {
		service.count(f_no);
		System.out.println(service.get(f_no).toString());
		model.addAttribute("board", service.get(f_no));
	}

	// 수정하기
	@PostMapping("/modify")
	public String modify(FboardVO board, RedirectAttributes rttr) {

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/fboard/list";
	}

	// 삭제하기
	@PostMapping("/remove")
	public String remove(@RequestParam("f_no") int f_no, RedirectAttributes rttr) {

		if (service.remove(f_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/fboard/list";
	}
	
	
	// 좋아요 기능
	@PostMapping("/like")
	@ResponseBody
	public void like(int f_no) {
		
		service.like(f_no);
		
	}
	
	
	// 섬머노트 파일업로드
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println("파일루트"+ fileRoot);
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace(); 
		}
		String a = jsonObject.toString();
		return a;
	}
}
