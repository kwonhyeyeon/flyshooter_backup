package com.fly.member.support.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.support.dao.SupportDao;
import com.fly.member.support.vo.SupportVO;

@Service
@Transactional
public class SupportServiceImpl implements SupportService {

	@Autowired
	private SupportDao supportDao;
	
	// 글 목록 구현
	@Override
	public List<SupportVO> supportList(SupportVO svo) {
		List<SupportVO> supportList = null;
		
		supportList = supportDao.supportList(svo);
		return supportList;
	}
	
	// 전체 레코드 수 구현
	@Override
	public int supportListCnt(SupportVO svo) {
		return supportDao.supportListCnt(svo);
	}
	
	// 글 상세 구현
	@Override
	public SupportVO supportView(SupportVO svo) {
		SupportVO supportview = null;
		supportview = supportDao.supportView(svo);
		return supportview;
	}
	
	// 글 입력 구현
	@Override
	public int supportInsert(SupportVO svo) {
		int result = 0;
		try {
			result = supportDao.supportInsert(svo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	// 글 수정 구현
	@Override
	public int supportUpdate(SupportVO svo) {
		int result = 0;
		try {
			result = supportDao.supportUpdate(svo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 신청 여부 변경 
	@Override
	public int supportMbdate(SupportVO svo) {
		return supportDao.supportMbdate(svo);
	}
	
	
}
