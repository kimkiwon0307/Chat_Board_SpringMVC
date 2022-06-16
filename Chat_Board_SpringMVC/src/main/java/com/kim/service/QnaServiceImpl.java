package com.kim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kim.domain.Criteria;
import com.kim.domain.QnaVO;
import com.kim.mapper.QnaMapper;

import lombok.AllArgsConstructor;

@Service // 서비스
@AllArgsConstructor //모든 생성자
public class QnaServiceImpl implements QnaService {

	//의존 관계
	private QnaMapper mapper;
	
	//게시판 등록
	@Override
	public void register(QnaVO qvo) {
		
		mapper.insert(qvo);
	}

	//게시판 조회
	@Override
	public QnaVO get(int q_no) {
		return mapper.read(q_no);
	}

	//게시판 수정
	@Override
	public boolean modify(QnaVO qvo) {
		return mapper.update(qvo)==1;
	}

	//게시판 삭제
	@Override
	public boolean remove(int q_no) {
		return mapper.delete(q_no)==1;
	}
	//게시판 목록
	@Override
	public List<QnaVO> getList() {
		return mapper.getList();
	}

	// 목록 + 페이징처리
	@Override
	public List<QnaVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	
	// 게시판 총갯수
	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	// 게시글 답글 처리
	@Override
	public void reply_insert(QnaVO qvo) {
		mapper.reply_insert(qvo);
	}
	
	// 게시글 조회수 처리
	@Override
	public void update_count(int q_no) {
		mapper.update_count(q_no);
	}
	
}
