package com.fly.member.login.dao;

import com.fly.member.login.vo.LoginVO;

public interface LoginDao {
	public LoginVO userIdSelect(String m_id);

	public int loginHistoryInsert(LoginVO lvo);

	public int loginHistoryUpdate(LoginVO lvo);

	public LoginVO loginHistorySelect(String m_id);

	public int todayRental(String m_id);

	public int passibleCal(String m_id);

	public int unpaidCal(String m_id);
}
