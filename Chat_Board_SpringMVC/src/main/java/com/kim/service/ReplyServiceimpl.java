package com.kim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kim.domain.ReplyVO;
import com.kim.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceimpl implements ReplyService{
	
	// 의존 객체 주입
	private ReplyMapper mapper;
	
	// 댓글 등록
	@Override
	public int register(ReplyVO reply) {
		return mapper.insert(reply);
	}

	// 댓글 읽기
	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	// 댓글 업데이트
	@Override
	public int modify(ReplyVO reply) {
		return mapper.update(reply);
	}

	// 댓글 삭제
	@Override
	public int remove(Long rno) {
		return mapper.delete(rno);
	}
	
	// 댓글 리스트
	@Override
	public List<ReplyVO> getList(Long f_no) {
		return mapper.list(f_no);
	}

}
