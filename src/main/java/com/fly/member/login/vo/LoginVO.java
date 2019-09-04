package com.fly.member.login.vo;

public class LoginVO extends LoginHistory {

	private String m_id; // 아이디
	private String m_pw; // 비밀번호
	private String m_name; // 이름
	private String m_type;
	
	
	@Override
	public int getRetry() {
		// TODO Auto-generated method stub
		return super.getRetry();
	}
	@Override
	public void setRetry(int retry) {
		// TODO Auto-generated method stub
		super.setRetry(retry);
	}
	@Override
	public long getLastFail() {
		// TODO Auto-generated method stub
		return super.getLastFail();
	}
	@Override
	public void setLastFail(long lastFail) {
		// TODO Auto-generated method stub
		super.setLastFail(lastFail);
	}
	@Override
	public long getLastPass() {
		// TODO Auto-generated method stub
		return super.getLastPass();
	}
	@Override
	public void setLastPass(long lastPass) {
		// TODO Auto-generated method stub
		super.setLastPass(lastPass);
	}
	@Override
	public String getClientIp() {
		// TODO Auto-generated method stub
		return super.getClientIp();
	}
	@Override
	public void setClientIp(String clientIp) {
		// TODO Auto-generated method stub
		super.setClientIp(clientIp);
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}

	@Override
	public String toString() {
		return "LoginVO [m_pw=" + m_pw + "]";
	}

}
