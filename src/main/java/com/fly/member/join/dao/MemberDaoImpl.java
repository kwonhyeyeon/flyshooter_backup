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

	private String NAME_SPACE = "com.fly.member.join.dao.MemberDao";

	@Override
	public int memberDelete(String userId) {
		return session.update(NAME_SPACE + ".memberDelete", userId);
	}

	@Override
	public int memberActive(String userId) {
		return session.update(NAME_SPACE + ".memberActive", userId);
	}

	@Override
	public int memberJoin(MemberVO mvo) {
		return session.insert(NAME_SPACE + ".memberJoin", mvo);
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		return (MemberVO) session.selectOne(NAME_SPACE + ".memberSelect", m_id);
	}

	@Override
	public String securitySelect(String m_id) {
		return session.selectOne(NAME_SPACE + ".securitySelect", m_id);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update(NAME_SPACE + ".memberUpdate", mvo);
	}

	@Override
	public int memberUpdatePN(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update(NAME_SPACE + ".memberUpdatePN", mvo);
	}

	@Override
	public int getKey(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update(NAME_SPACE + ".GetKey", mvo);
	}

	@Override
	public int alterUserKey(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update(NAME_SPACE + ".alter_userKey", mvo);
	}

	@Override
	public List<MemberVO> memberidserchC(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList(NAME_SPACE + ".memberidserchC", mvo);
	}

	@Override
	public List<MemberVO> memberidserchU(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.selectList(NAME_SPACE + ".memberidserchU", mvo);
	}

	@Override
	public int pwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update(NAME_SPACE + ".pwUpdate", mvo);
	}

}
