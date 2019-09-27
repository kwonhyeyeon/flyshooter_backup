package com.fly.admin.rentalstatus.vo;

public class AdminRentalStatusVO {

	private int r_no; // 구장 일련번호
	private String r_regdate; // 대관 신청 시간
	private int count;

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "AdminRentalStatusVO [r_no=" + r_no + ", r_regdate=" + r_regdate + ", count=" + count + "]";
	}

}
