package com.fly.admin.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.join.vo.MemberVO;
@Repository("adminMemberDao")
public class AdminMemberDaoImpl implements AdminMemberDao {
	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.admin.member.dao.AdminMemberDao";
	
	@Override
	public List<MemberVO> getMemberList(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".selectMemberList", mvo);
	}

	@Override
	public int searchUserReservedCnt(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".searchUserReservedCnt", mvo);
	}

	@Override
	public void updateMember(MemberVO mvo) {
		// TODO Auto-generated method stub
		sqlSession.update(NAME_SPACE + ".updateMember", mvo);
		
	}

	@Override
	public int searchClientPlaceCnt(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".searchClientPlaceCnt", mvo);
	}

	@Override
	public int getTotalSize(MemberVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".getListSize", mvo);
	}

}
