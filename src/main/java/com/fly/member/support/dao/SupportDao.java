package com.fly.member.support.dao;

import java.util.List;

import com.fly.member.support.vo.SupportVO;

public interface SupportDao {
	
	public List<SupportVO> supportList(SupportVO svo); // 글목록 구현
	
	public int supportListCnt(SupportVO svo); // 글 목록 페이지 구현
	
	public SupportVO supportView(SupportVO svo); // 글 상세보기

	public int supportInsert(SupportVO svo); // 글 쓰기 등록

	public int supportUpdate(SupportVO svo); // 글 수정 구현

	public int supportMbdate(SupportVO svo); // 신청여부 변경
	
	public int supportStatusUpdate(SupportVO svo); // 글 삭제 구현
	
	public List<SupportVO> adminSupportList(SupportVO svo); // 관리자용 글목록 구현
	
	public int adminSupportListCnt(SupportVO svo); // 관리자용  글 목록 페이지 구현
}
	

