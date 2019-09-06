package com.fly.member.login.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.login.dao.LoginDAO;
import com.fly.member.login.vo.LoginVO;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {
	@Autowired
	@Qualifier("loginDao")
	private LoginDAO loginDao;

	@Override
	public LoginVO userIdSelect(String m_id) {
		return loginDao.userIdSelect(m_id);
	}

	@Override
	public LoginVO loginSelect(String m_id) {
		LoginVO lvo = new LoginVO();
		
		lvo.setM_id(m_id);
		lvo = loginDao.loginSelect(lvo);

		return lvo;
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
		System.out.println("33333333333");
		return loginDao.loginHistorySelect(m_id);
	}

}
