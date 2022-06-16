package com.kim.service;

import java.util.List;

import com.kim.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO reply);  // 댓글 등록
	 
 	public ReplyVO get(Long rno);        // 댓글 읽기
	
	public int modify(ReplyVO reply);    // 댓글 업데이트
	
	public int remove(Long rno);         // 댓글 삭제
	
	public List<ReplyVO> getList(Long f_no);      // 댓글 목록
}
