package com.fly.common.login.vo;

public class LoginVO extends LoginHistory  {
	
		private String m_id = ""; // 아이디
		private String m_pw = ""; // 비밀번호
		private String m_name = ""; //이름
		
	
	public LoginVO() {}
	public LoginVO(String m_id, String m_pw, String m_name) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
	}
	
	//get set
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
	
	@Override
	public String toString() {
		return "LoginVO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", getRetry()=" + getRetry()
				+ ", getLastFail()=" + getLastFail() + ", getLastPass()=" + getLastPass() + ", getClientIp()="
				+ getClientIp() + "]";
	}
		
		
}
