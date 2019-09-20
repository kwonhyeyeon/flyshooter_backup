package com.fly.member.match.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.common.vo.CommonVO;
import com.fly.member.match.vo.MatchVO;

@Repository("matchDAO")
public class MatchDaoImpl implements MatchDao {

	@Autowired
	private SqlSession sqlSession;

	// 글 목록 구현
	@Override
	public List<MatchVO> matchList(MatchVO mavo) {
		return sqlSession.selectList("matchList", mavo);
	}

	// 글 등록 구현

	@Override
	public int matchInsert(MatchVO mavo) {
		return sqlSession.insert("matchInsert", mavo);
	}

	// 글 상세보기 구현
	@Override
	public MatchVO matchView(MatchVO mavo) {
		return (MatchVO) sqlSession.selectOne("matchView", mavo);
	}

	// 글 수정 구현
	@Override
	public int matchUpdate(MatchVO mavo) {
		return sqlSession.update("matchUpdate", mavo);
	}
	
	//  전체 레코드 건수 구현
	@Override
	public int matchListCnt(MatchVO mavo) {
		return (Integer)sqlSession.selectOne("matchListCnt", mavo);
	}

	// 신청여부 변경
	@Override
	public int updateMbdate(MatchVO mavo) {
		// TODO Auto-generated method stub
		return sqlSession.update("updateMbdate", mavo);
	}
	
	// 글 삭제 구현
	@Override
	public int matchStatusUpdate(MatchVO mavo) {
		return sqlSession.update("matchStatusUpdate", mavo);
	}
	
	// 관리자용 글 목록 구현
	@Override
	public List<MatchVO> adminMatchList(MatchVO mavo) {
		return sqlSession.selectList("adminMatchList", mavo);
	}

	// 관리자용 전체 레코드 건수 구현
	@Override
	public int adminMatchListCnt(MatchVO mavo) {
		return (Integer)sqlSession.selectOne("adminMatchListCnt", mavo);
	}



}
