package com.fly.common.member.vo;

public class LoginHistory {
	private String m_id;
	private int retry;
	private long lastFail;
	private long lastPass;
	private String clientIp;
	
	
	public LoginHistory() {}
	public LoginHistory(String m_id, int retry, long lastFail, long lastPass, String clientIp) {
		super();
		this.m_id = m_id;
		this.retry = retry;
		this.lastFail = lastFail;
		this.lastPass = lastPass;
		this.clientIp = clientIp;
	}
	
	//get set
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getRetry() {
		return retry;
	}
	public void setRetry(int retry) {
		this.retry = retry;
	}
	public long getLastFail() {
		return lastFail;
	}
	public void setLastFail(long lastFail) {
		this.lastFail = lastFail;
	}
	public long getLastPass() {
		return lastPass;
	}
	public void setLastPass(long lastPass) {
		this.lastPass = lastPass;
	}
	public String getClientIp() {
		return clientIp;
	}
	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}
}
