package com.fly.member.login.vo;

public class LoginHistory {
	private int retry;//재시도
	private long lastFail;// 최근 실패 시간
	private long lastPass; // 최근 성공 시간
	private String clientIp;// IP
	
	
	public LoginHistory() {}
	public LoginHistory(int retry, long lastFail, long lastPass, String clientIp) {
		super();
		this.retry = retry;
		this.lastFail = lastFail;
		this.lastPass = lastPass;
		this.clientIp = clientIp;
	}
	
	//get set
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
