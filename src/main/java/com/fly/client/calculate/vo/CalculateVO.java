package com.fly.client.calculate.vo;

import com.fly.member.place.vo.PlaceVO;

public class CalculateVO extends PlaceVO {
	private int c_no;
	private int c_payment;
	private String c_payment_date;
	private int c_status;
	private String c_regdate;
	private int c_rental_cnt;
	private int c_return_cnt;

	// getter and setter
	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_payment() {
		return c_payment;
	}

	public void setC_payment(int c_payment) {
		this.c_payment = c_payment;
	}

	public String getC_payment_date() {
		return c_payment_date;
	}

	public void setC_payment_date(String c_payment_date) {
		this.c_payment_date = c_payment_date;
	}

	public int getC_status() {
		return c_status;
	}

	public void setC_status(int c_status) {
		this.c_status = c_status;
	}

	public String getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}

	public int getC_rental_cnt() {
		return c_rental_cnt;
	}

	public void setC_rental_cnt(int c_rental_cnt) {
		this.c_rental_cnt = c_rental_cnt;
	}

	public int getC_return_cnt() {
		return c_return_cnt;
	}

	public void setC_return_cnt(int c_return_cnt) {
		this.c_return_cnt = c_return_cnt;
	}

	@Override
	public String toString() {
		return "CalculateVO [c_no=" + c_no + ", c_payment=" + c_payment + ", c_payment_date=" + c_payment_date
				+ ", c_status=" + c_status + ", c_regdate=" + c_regdate + ", c_rental_cnt=" + c_rental_cnt
				+ ", c_return_cnt=" + c_return_cnt + "]";
	}

}
