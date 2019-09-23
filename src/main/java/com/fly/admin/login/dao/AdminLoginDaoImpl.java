package com.fly.admin.login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.admin.statistics.vo.StatisticsVO;
import com.fly.member.join.vo.MemberVO;

@Repository("adminLoginDao")
public class AdminLoginDaoImpl implements AdminLoginDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "com.fly.admin.login.dao.AdminLoginDao";

	/*
	 * @Override public int registCnt(String date) { return
	 * sqlSession.selectOne(NAME_SPACE + ".registCnt", date); }
	 * 
	 * @Override public int placeCnt(String date) { return
	 * sqlSession.selectOne(NAME_SPACE + ".placeCnt", date); }
	 * 
	 * @Override public int rentalCnt(String date) { return
	 * sqlSession.selectOne(NAME_SPACE + ".rentalCnt", date); }
	 * 
	 * @Override public int matchCnt(String date) { return
	 * sqlSession.selectOne(NAME_SPACE + ".matchCnt", date); }
	 * 
	 * @Override public int supportCnt(String date) { return
	 * sqlSession.selectOne(NAME_SPACE + ".supportCnt", date); }
	 */

	@Override
	public List<StatisticsVO> getStatistics() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".getSttst");
	}

}
