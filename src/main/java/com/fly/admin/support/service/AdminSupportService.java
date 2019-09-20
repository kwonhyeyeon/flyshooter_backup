package com.fly.admin.support.service;

import java.util.List;

import com.fly.member.support.vo.SupportVO;

public interface AdminSupportService {
	
	public List<SupportVO> adminSupportList(SupportVO svo); // 글목록 구현
	
	public int adminSupportListCnt(SupportVO svo); //  글 목록 페이지 구현
	
	public SupportVO supportView(SupportVO svo); // 글 상세보기
	
	public int supportStatusUpdate(SupportVO svo); // 글 삭제 구현
	
}
