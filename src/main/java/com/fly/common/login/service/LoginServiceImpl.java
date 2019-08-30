package com.fly.common.login.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.common.login.dao.LoginDAO;
import com.fly.common.login.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDao;
	
	@Override
	public LoginVO userIdSelect(String m_id) {
		return loginDao.userIdSelect(m_id);
	}

	@Override
	public LoginVO loginSelect(String m_id, String m_pw) {
		//TODO LoginVO vo = null;
		
		return null;
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) throws SQLException {
		int result;
		if(userIdSelect(lvo.getM_id())==null) {
			result = 1;
		}else {
			LoginVO vo = loginHistorySelect(lvo.getM_id());
			if(vo == null) {
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

}
