package com.fly.admin.match.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.common.page.BoardPagingUtils;
import com.fly.member.match.dao.MatchDao;
import com.fly.member.match.vo.MatchVO;

@Service
@Transactional
public class AdminMatchServiceImpl implements AdminMatchService {

	@Autowired
	private MatchDao matchDao;
	
	// 글 목록 구현
	@Override
	public List<MatchVO> adminMatchList(MatchVO mavo) {
		List<MatchVO> amatchList = null;
		
		// 페이징 세팅
		BoardPagingUtils.setPage(mavo);
		
		amatchList = matchDao.adminMatchList(mavo);
		return amatchList;
	}
	
	// 전체 레코드 수 구현 
	@Override
	public int adminMatchListCnt(MatchVO mavo) {
		int countNum = 0;
		countNum = matchDao.adminMatchListCnt(mavo);
		return countNum;
	}

	// 상세보기
	@Override
	public MatchVO matchView(MatchVO mavo) {
		MatchVO matchview = null;
		matchview = matchDao.matchView(mavo);
		return matchview;
	}

	// 글 삭제 처리 구현
	@Override
	public int matchStatusUpdate(MatchVO mavo) {
		return matchDao.matchStatusUpdate(mavo);
	}

}
