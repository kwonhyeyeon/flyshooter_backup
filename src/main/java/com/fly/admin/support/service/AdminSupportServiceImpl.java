package com.fly.admin.support.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.common.page.BoardPagingUtils;
import com.fly.member.support.dao.SupportDao;
import com.fly.member.support.vo.SupportVO;

@Service
@Transactional
public class AdminSupportServiceImpl implements AdminSupportService {

	@Autowired
	private SupportDao supportDao;
	
	// 글 목록 구현
	@Override
	public List<SupportVO> adminSupportList(SupportVO svo) {
		List<SupportVO> asupportList = null;
		
		// 페이징 세팅
		BoardPagingUtils.setPage(svo);
		
		asupportList = supportDao.adminSupportList(svo);
		return asupportList;
	}
	
	// 전체 레코드 수 구현 
	@Override
	public int adminSupportListCnt(SupportVO svo) {
		int countNum = 0;
		countNum = supportDao.adminSupportListCnt(svo);
		return countNum;
	}
	
	// 상세보기
	@Override
	public SupportVO supportView(SupportVO svo) {
		SupportVO supportview = null;
		supportview = supportDao.supportView(svo);
		return supportview;
	}

	// 글 삭제 처리 구현
	@Override
	public int supportStatusUpdate(SupportVO svo) {
		return supportDao.supportStatusUpdate(svo);
	}

}
