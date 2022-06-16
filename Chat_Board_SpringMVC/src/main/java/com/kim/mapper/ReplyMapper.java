package com.kim.mapper;

import java.util.List;

import com.kim.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO reply); // 댓글 새글 만들기 
	
	public ReplyVO read(Long rno); //    댓글 조회
	
	public int update(ReplyVO reply); // 댓글 수정하기
	
	public int delete(Long rno);  //     댓글 삭제하기
	
	public List<ReplyVO> list(Long f_no); //      댓글 목록 
	
}
