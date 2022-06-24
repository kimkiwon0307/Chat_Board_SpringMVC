package com.kim.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kim.domain.FboardVO;
import com.kim.domain.Criteria;
import com.kim.mapper.FboardMapper;

import lombok.AllArgsConstructor;

@Service // 서비스
@AllArgsConstructor //모든 생성자
public class FboardServiceImpl implements FboardService {

	//의존 관계
	private FboardMapper mapper;
	
	//게시판 등록
	@Override
	public void register(FboardVO board) {
		mapper.insert(board);
	}
	//게시판 조회
	@Override
	public FboardVO get(int f_no) {
		return mapper.read(f_no);
	}
	//게시판 수정
	@Override
	public boolean modify(FboardVO board) {
		return mapper.update(board)==1;
	}
	//게시판 삭제
	@Override
	public boolean remove(int f_no) {
		return mapper.delete(f_no)==1;
	}
	//게시판 목록
	@Override
	public List<FboardVO> getList() {
		return mapper.getList();
	}
	
	//게시판 목록 + 페이징
	@Override
	public List<FboardVO> getList(Criteria cri) {
		
		System.out.println(cri.getKeyword());
			
		return mapper.getListWithPaging(cri);
	}

	//게시판 총 갯수
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	//좋아요 기능
	@Override
	public void like(int f_no) {
		mapper.like(f_no);
	}
	
	// 조회수
	@Override
	public void count(int f_no) {
		mapper.count(f_no);
	}

}
