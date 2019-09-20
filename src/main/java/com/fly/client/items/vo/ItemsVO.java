package com.fly.client.items.vo;

import com.fly.member.place.vo.PlaceVO;

public class ItemsVO extends PlaceVO {

	private int i_no;
	private String i_name;
	private int i_rental_fee;
	private int i_use;
	private int i_status;
	private String i_regdate;

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_rental_fee() {
		return i_rental_fee;
	}

	public void setI_rental_fee(int i_rental_fee) {
		this.i_rental_fee = i_rental_fee;
	}

	public int getI_use() {
		return i_use;
	}

	public void setI_use(int i_use) {
		this.i_use = i_use;
	}

	public int getI_status() {
		return i_status;
	}

	public void setI_status(int i_status) {
		this.i_status = i_status;
	}

	public String getI_regdate() {
		return i_regdate;
	}

	public void setI_regdate(String i_regdate) {
		this.i_regdate = i_regdate;
	}

	@Override
	public String toString() {
		return "ItemsVO [i_no=" + i_no + ", i_name=" + i_name + ", i_rental_fee=" + i_rental_fee + ", i_use=" + i_use
				+ ", i_status=" + i_status + ", i_regdate=" + i_regdate + "]";
	}

}
