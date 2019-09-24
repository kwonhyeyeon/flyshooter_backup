package com.fly.member.support.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.support.vo.SupportVO;

@Repository("SupportDao")
public class SupportDaoImpl implements SupportDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 글 목록 구현
	@Override
	public List<SupportVO> supportList(SupportVO svo) {
		return sqlSession.selectList("supportList", svo);
	}
	
	// 전체 레코드 건수 구현
	@Override
	public int supportListCnt(SupportVO svo) {
		return (Integer)sqlSession.selectOne("supportListCnt", svo);
	}
	
	// 글 상세보기 구현
	@Override
	public SupportVO supportView(SupportVO svo) {
		return sqlSession.selectOne("supportView", svo);
	}
	
	// 글 등록 구현
	@Override
	public int supportInsert(SupportVO svo) {
		return sqlSession.insert("supportInsert", svo);
	}
	
	// 글 수정 구현
	@Override
	public int supportUpdate(SupportVO svo) {
		return sqlSession.update("supportUpdate", svo);
	}
	
	// 신청 여부 변경
	@Override
	public int supportMbdate(SupportVO svo) {
		return sqlSession.update("supportMbdate", svo);
	}
	
	// 글 삭제 구현
	@Override
	public int supportStatusUpdate(SupportVO svo) {
		return sqlSession.update("supportStatusUpdate", svo);
	}
	
	// 관리자용 글 목록 구현
	@Override
	public List<SupportVO> adminSupportList(SupportVO svo) {
		return sqlSession.selectList("adminSupportList", svo);
	}
	
	// 관리자용 전체 레코드 건수 구현
	@Override
	public int adminSupportListCnt(SupportVO svo) {
		return (Integer)sqlSession.selectOne("adminSupportListCnt", svo);
	}

}
