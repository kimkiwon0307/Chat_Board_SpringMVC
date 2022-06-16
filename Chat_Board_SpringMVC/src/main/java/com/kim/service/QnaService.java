package com.kim.service;

import java.util.List;

import com.kim.domain.Criteria;
import com.kim.domain.QnaVO;

public interface QnaService {
	
	//게시판 등록
	public void register(QnaVO qvo);
	
	//게시판 조회
	public QnaVO get(int q_no);
	
	//게시판 수정
	public boolean modify(QnaVO qvo);
	
	//게시판 삭제
	public boolean remove(int q_no);
	
	//게시판 목록
	public List<QnaVO> getList();

	//게시판 목록 + 페이징
	public List<QnaVO> getList(Criteria cri);
	
	//게시판 총 갯수
	public int getTotalCount();
	
	//답글 처리
	public void reply_insert(QnaVO qvo);
	
	//조회수 처리
	public void update_count(int q_no);
	
}
