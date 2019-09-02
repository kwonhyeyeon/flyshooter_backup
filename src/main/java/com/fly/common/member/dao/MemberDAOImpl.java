package com.fly.common.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.common.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession session;

	@Override
	public int memberDelete(String userId) {
		return session.delete("memberDelete", userId);
	}

	@Override
	public int memberJoin(MemberVO mvo) {
		return session.insert("memberJoin");
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
	public int GetKey(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("GetKey", mvo);
	}

	@Override
	public int alter_userKey(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("alter_userKey", mvo);
	}

}
