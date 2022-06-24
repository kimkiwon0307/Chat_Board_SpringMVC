package com.kim.mapper;

import java.util.List;

import com.kim.domain.FboardVO;
import com.kim.domain.Criteria;

public interface FboardMapper {
	
	//게시판 목록
	public List<FboardVO> getList();
	
	//게시판 등록
	public void insert(FboardVO board);
	
	//게시판 등록후  PK값(게시글 번호) 알기
	public void insertSelectKey(FboardVO board);
	
	//게시판 조회
	public FboardVO read(int bno);
	
	//게시판 삭제
	public int delete (int bno);
	
	//게시판 수정
	public int update (FboardVO board);
	
	//게시글 총 갯수
	public int getTotalCount(Criteria cri);

	//게시판 목록 + 페이징
	public List<FboardVO> getListWithPaging(Criteria cri);
	
	// 좋아요기능
	public void like(int f_no);
	
	// 조회수
	public void count(int f_no);
}
