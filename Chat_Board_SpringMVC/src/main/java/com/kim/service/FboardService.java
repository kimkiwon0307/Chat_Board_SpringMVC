package com.kim.service;

import java.util.List;

import com.kim.domain.FboardVO;
import com.kim.domain.Criteria;

public interface FboardService {
	
	//게시판 등록
	public void register(FboardVO board);
	
	//게시판 조회
	public FboardVO get(int f_no);
	
	//게시판 수정
	public boolean modify(FboardVO board);
	
	//게시판 삭제
	public boolean remove(int f_no);
	
	//게시판 목록
	public List<FboardVO> getList();

	//게시판 목록 + 페이징
	public List<FboardVO> getList(Criteria cri);
	
	//게시글 총 갯수
	public int getTotalCount(Criteria cri);
}


