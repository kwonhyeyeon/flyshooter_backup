package com.fly.admin.recruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.common.page.Paging;
import com.fly.member.recruit.dao.RecruitDao;
import com.fly.member.recruit.vo.RecruitVO;

@Service
@Transactional
public class AdminRecruitServiceImpl implements AdminRecruitService {
	@Autowired
	private RecruitDao recruitDao;
	
	// 글 목록 구현
	@Override
	public List<RecruitVO> adminRecruitList(RecruitVO revo) {
		List<RecruitVO> arecruitList = null;
		
		// 페이징 세팅
		Paging.setPage(revo);
		
		arecruitList = recruitDao.adminRecruitList(revo);
		return arecruitList;
	}
	
	// 전체 레코드 수 구현 
	@Override
	public int adminRecruitListCnt(RecruitVO revo) {
		int countNum = 0;
		countNum = recruitDao.adminRecruitListCnt(revo);
		return countNum;
	}
	
	// 상세보기
	@Override
	public RecruitVO recruitView(RecruitVO revo) {
		RecruitVO recruitView = null;
		recruitView = recruitDao.recruitView(revo);
		return recruitView;
	}
	
	// 글 삭제 처리 구현
	@Override
	public int recruitStatusUpdate(RecruitVO revo) {
		return recruitDao.recruitStatusUpdate(revo);
	}

}
