package com.fly.client.stats.vo;

public class StatsVO {
	private String p_num;
	private String p_name;
	private String status;
	private String year;
	private int s_no;
	
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	@Override
	public String toString() {
		return "StatisticsVO [getP_num()=" + getP_num() + ", getP_name()=" + getP_name() + ", getStatus()="
				+ getStatus() + ", getYear()=" + getYear() + "]";
	}
	
}
