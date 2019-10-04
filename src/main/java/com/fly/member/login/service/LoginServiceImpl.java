package com.fly.member.login.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.login.dao.LoginDao;
import com.fly.member.login.vo.LoginVO;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {
	@Autowired
	@Qualifier("loginDao")
	private LoginDao loginDao;

	@Override
	public LoginVO userIdSelect(String m_id) {
		return loginDao.userIdSelect(m_id);
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) throws SQLException {
		int result;
		if (userIdSelect(lvo.getM_id()) == null) {
			result = 1;
		} else {
			LoginVO vo = loginHistorySelect(lvo.getM_id());
			if (vo == null) {
				loginDao.loginHistoryInsert(lvo);
			}
			result = 2;
		}
		return result;
	}

	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return loginDao.loginHistoryUpdate(lvo);
	}

	@Override
	public LoginVO loginHistorySelect(String m_id) {
		return loginDao.loginHistorySelect(m_id);
	}

	@Override
	public int todayRental(String m_id) {
		// TODO Auto-generated method stub
		return loginDao.todayRental(m_id);
	}

	@Override
	public int passibleCal(String m_id) {
		// TODO Auto-generated method stub
		return loginDao.passibleCal(m_id);
	}

	@Override
	public int unpaidCal(String m_id) {
		// TODO Auto-generated method stub
		return loginDao.unpaidCal(m_id);
	}

}
