package com.fly.member.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.login.vo.LoginVO;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {
	@Autowired
	private SqlSession session;

	private String NAME_SPACE = "com.fly.member.login.dao.LoginDao";

	@Override
	public LoginVO userIdSelect(String m_id) {

		return (LoginVO) session.selectOne(NAME_SPACE + ".userIdSelect", m_id);
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		return session.insert(NAME_SPACE + ".loginHistoryInsert", lvo);

	}

	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return session.update(NAME_SPACE + ".loginHistoryUpdate", lvo);
	}

	@Override
	public LoginVO loginHistorySelect(String m_id) {
		return session.selectOne(NAME_SPACE + ".loginHistorySelect", m_id);

	}

}
