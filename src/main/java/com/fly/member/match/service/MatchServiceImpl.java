package com.fly.member.match.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.common.vo.CommonVO;
import com.fly.member.match.dao.MatchDao;
import com.fly.member.match.vo.MatchVO;

@Service
@Transactional
public class MatchServiceImpl implements MatchService {
	@Autowired
	private MatchDao matchDao;

	// 글 목록 구현
	@Override
	public List<MatchVO> matchList(MatchVO mavo) {
		List<MatchVO> matchList = null;

		matchList = matchDao.matchList(mavo);
		return matchList;
	}

	// 글 입력 구현
	@Override
	public int matchInsert(MatchVO mavo) {
		int result = 0;
		try {
			result = matchDao.matchInsert(mavo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	// 글 상세 구현
	@Override
	public MatchVO matchView(MatchVO mavo) {
		MatchVO matchview = null;
		matchview = matchDao.matchView(mavo);
		return matchview;
	}

	// 글 수정 구현
	@Override
	public int matchUpdate(MatchVO mavo) {
		int result = 0;
		try {
			result = matchDao.matchUpdate(mavo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	// 전체 레코드 수 구현
	@Override
	public int matchListCnt(MatchVO mavo) {
		return matchDao.matchListCnt(mavo);
	}

	
	// 신청 여부 변경 
	@Override
	public int updateMbdate(MatchVO mavo) {
		return matchDao.updateMbdate(mavo);
	}




}
