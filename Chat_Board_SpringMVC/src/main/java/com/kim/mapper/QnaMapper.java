package com.kim.mapper;

import java.util.List;

import com.kim.domain.FboardVO;
import com.kim.domain.QnaVO;
import com.kim.domain.Criteria;

public interface QnaMapper {
	
	//게시판 목록
	public List<QnaVO> getList();
	
	//게시판 목록 + 페이징
	public List<QnaVO> getListWithPaging(Criteria cri);

	//게시판 등록
	public void insert(QnaVO Qvo);
	
	//게시판 조회
	public QnaVO read(int q_no);
	
	//게시판 삭제
	public int delete (int q_no);
	
	//게시판 수정
	public int update (QnaVO Qvo);
	
	//게시글 총 갯수
	public int getTotalCount();
	
	//답글 등록
	public void reply_insert(QnaVO qvo);
	
	// 조회수 처리
	public void update_count(int q_no);
	
	
}
