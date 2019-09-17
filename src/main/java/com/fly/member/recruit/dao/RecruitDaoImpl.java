package com.fly.member.recruit.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.recruit.vo.RecruitVO;

@Repository("RecruitDao")
public class RecruitDaoImpl implements RecruitDao {
	
	@Autowired
	private SqlSession sqlSession;

	// 글 목록 구현
	@Override
	public List<RecruitVO> recruitList(RecruitVO revo) {
		return sqlSession.selectList("recruitList", revo);
	}
	
	// 전체 레코드 건수 구현
	@Override
	public int recruitListCnt(RecruitVO revo) {
		return (Integer)sqlSession.selectOne("recruitListCnt", revo);
	}

	// 글 상세보기 구현
	@Override
	public RecruitVO recruitView(RecruitVO revo) {
		return sqlSession.selectOne("recruitView", revo);
	}
	
	// 글 등록 구현
	@Override
	public int recruitInsert(RecruitVO revo) {
		return sqlSession.insert("recruitInsert", revo);
	}
	
	// 글 수정 구현
	@Override
	public int recruitUpdate(RecruitVO revo) {
		return sqlSession.update("recruitUpdate", revo);
	}

	// 신청 여부 변경
	@Override
	public int recruitMbdate(RecruitVO revo) {
		return sqlSession.update("recruitMbdate", revo);
	}

}
