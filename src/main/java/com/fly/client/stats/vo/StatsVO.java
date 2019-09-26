package com.fly.client.stats.vo;

public class StatsVO {
	private String s_name;// 경기장 이름
	private String r_reserve_date;//대관 결제 날짜
	private int count;//결제일렬번호
	private int r_no;//결제 일렬번호
	
	
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getR_reserve_date() {
		return r_reserve_date;
	}
	public void setR_reserve_date(String r_reserve_date) {
		this.r_reserve_date = r_reserve_date;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	
	
}
