package com.fly.member.join.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.join.vo.MemberVO;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession session;

	@Override
	public int memberDelete(String userId) {
		return session.update("memberDelete", userId);
	}
	@Override
	public int memberActive(String userId) {
		return session.update("memberActive", userId);
	}

	@Override
	public int memberJoin(MemberVO mvo) {
		return session.insert("memberJoin", mvo);
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		return (MemberVO) session.selectOne("memberSelect", m_id);
	}

	@Override
	public String securitySelect(String m_id) {
		return session.selectOne("securitySelect", m_id);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberUpdatePN(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("memberUpdatePN", mvo);
	}

	@Override
	public int GetKey(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("GetKey", mvo);
	}

	@Override
	public int alter_userKey(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("alter_userKey", mvo);
	}

	@Override
	public List<MemberVO> memberidserchC(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("memberidserchC", mvo);
	}

	@Override
	public List<MemberVO> memberidserchU(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList("memberidserchU", mvo);
	}

	@Override
	public int pwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("pwUpdate", mvo);
	}

}
