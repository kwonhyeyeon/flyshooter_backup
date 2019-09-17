package com.fly.member.recruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.recruit.dao.RecruitDao;
import com.fly.member.recruit.vo.RecruitVO;

@Service
@Transactional
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDao recruitDao;
	
	// 글 목록 구현
	@Override
	public List<RecruitVO> recruitList(RecruitVO revo) {
		List<RecruitVO> recruitList = null;
		
		recruitList = recruitDao.recruitList(revo);
		
		return recruitList;
	}
	
	// 전체 레코드 수 구현
	@Override
	public int recruitListCnt(RecruitVO revo) {
		return recruitDao.recruitListCnt(revo);
	}
	
	// 글 상세 구현
	@Override
	public RecruitVO recruitView(RecruitVO revo) {
		RecruitVO recruitView = null;
		recruitView = recruitDao.recruitView(revo);
		return recruitView;
	}
	
	// 글 입력 구현
	@Override
	public int recruitInsert(RecruitVO revo) {
		int result = 0;
		try {
			result = recruitDao.recruitInsert(revo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	// 글 수정 구현
	@Override
	public int recruitUpdate(RecruitVO revo) {
		int result = 0;
		try {
			result = recruitDao.recruitUpdate(revo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	// 신청 여부 변경 
	@Override
	public int recruitMbdate(RecruitVO revo) {
		return recruitDao.recruitMbdate(revo);
	}

}
