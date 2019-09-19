package com.fly.member.login.vo;

public class LoginVO extends LoginHistory {

	private String m_id; // 아이디
	private String m_pw; // 비밀번호
	private String m_name; // 이름
	private int m_type;
	private String email_confirm;

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

	public int getM_type() {
		return m_type;
	}

	public void setM_type(int m_type) {
		this.m_type = m_type;
	}

	public String getEmail_confirm() {
		return email_confirm;
	}

	public void setEmail_confirm(String email_confirm) {
		this.email_confirm = email_confirm;
	}

	@Override
	public String toString() {
		return "LoginVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_type=" + m_type
				+ ", email_confirm=" + email_confirm + "]";
	}

}
