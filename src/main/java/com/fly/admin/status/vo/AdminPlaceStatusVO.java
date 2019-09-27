package com.fly.admin.status.vo;

public class AdminPlaceStatusVO {

	private int p_ok; // 구장 승인상태
	private String p_ok_date; // 구장 승인일
	private int count;

	public int getP_ok() {
		return p_ok;
	}

	public void setP_ok(int p_ok) {
		this.p_ok = p_ok;
	}

	public String getP_ok_date() {
		return p_ok_date;
	}

	public void setP_ok_date(String p_ok_date) {
		this.p_ok_date = p_ok_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "AdminStatusVO [p_ok=" + p_ok + ", p_ok_date=" + p_ok_date + ", count=" + count + "]";
	}

}
