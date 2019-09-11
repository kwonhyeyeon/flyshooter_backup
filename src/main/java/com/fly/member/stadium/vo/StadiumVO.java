package com.fly.member.stadium.vo;

import com.fly.client.place.vo.PlaceVO;

public class StadiumVO extends PlaceVO {
	private int s_no; // 경기장 일렬번호
	private String s_name; // 경기장 이름
	private int s_size;// 경기장 사이즈
	private int s_d_fee;// 평일 주간 요금
	private int s_n_fee;//평일 야간 요금
	private int s_d_fee_w;//주말 주간 요금
	private int s_n_fee_w;//주말 야간 요금
	private int s_people;//수용인원
	private int s_open;//오픈시간
	private int s_close;//마감시간
	private String s_img1;//경기장 이미지1
	private String s_img2;//경기장 이미지2
	private String s_img3;//경기장 이미지3
	private int s_in_out;//경기장 실외/실내
	private int s_status;// 경기장 상태
	private int s_hours; // 경기장 최소 이용시간 
	private String s_regdate; // 경기장 등록일
	private int s_ok;//경기장 승인 상태
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_size() {
		return s_size;
	}
	public void setS_size(int s_size) {
		this.s_size = s_size;
	}
	public int getS_d_fee() {
		return s_d_fee;
	}
	public void setS_d_fee(int s_d_fee) {
		this.s_d_fee = s_d_fee;
	}
	public int getS_n_fee() {
		return s_n_fee;
	}
	public void setS_n_fee(int s_n_fee) {
		this.s_n_fee = s_n_fee;
	}
	public int getS_d_fee_w() {
		return s_d_fee_w;
	}
	public void setS_d_fee_w(int s_d_fee_w) {
		this.s_d_fee_w = s_d_fee_w;
	}
	public int getS_n_fee_w() {
		return s_n_fee_w;
	}
	public void setS_n_fee_w(int s_n_fee_w) {
		this.s_n_fee_w = s_n_fee_w;
	}
	public int getS_people() {
		return s_people;
	}
	public void setS_people(int s_people) {
		this.s_people = s_people;
	}
	public int getS_open() {
		return s_open;
	}
	public void setS_open(int s_open) {
		this.s_open = s_open;
	}
	public int getS_close() {
		return s_close;
	}
	public void setS_close(int s_close) {
		this.s_close = s_close;
	}
	public String getS_img1() {
		return s_img1;
	}
	public void setS_img1(String s_img1) {
		this.s_img1 = s_img1;
	}
	public String getS_img2() {
		return s_img2;
	}
	public void setS_img2(String s_img2) {
		this.s_img2 = s_img2;
	}
	public String getS_img3() {
		return s_img3;
	}
	public void setS_img3(String s_img3) {
		this.s_img3 = s_img3;
	}
	public int getS_in_out() {
		return s_in_out;
	}
	public void setS_in_out(int s_in_out) {
		this.s_in_out = s_in_out;
	}
	public int getS_status() {
		return s_status;
	}
	public void setS_status(int s_status) {
		this.s_status = s_status;
	}
	public int getS_hours() {
		return s_hours;
	}
	public void setS_hours(int s_hours) {
		this.s_hours = s_hours;
	}
	public String getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(String s_regdate) {
		this.s_regdate = s_regdate;
	}
	public int getS_ok() {
		return s_ok;
	}
	public void setS_ok(int s_ok) {
		this.s_ok = s_ok;
	}
	
	@Override
	public String toString() {
		return "StadiumVO [getS_no()=" + getS_no() + ", getS_name()=" + getS_name() + ", getS_size()=" + getS_size()
				+ ", getS_d_fee()=" + getS_d_fee() + ", getS_n_fee()=" + getS_n_fee() + ", getS_d_fee_w()="
				+ getS_d_fee_w() + ", getS_n_fee_w()=" + getS_n_fee_w() + ", getS_people()=" + getS_people()
				+ ", getS_open()=" + getS_open() + ", getS_close()=" + getS_close() + ", getS_img1()=" + getS_img1()
				+ ", getS_img2()=" + getS_img2() + ", getS_img3()=" + getS_img3() + ", getS_in_out()=" + getS_in_out()
				+ ", getS_status()=" + getS_status() + ", getS_hours()=" + getS_hours() + ", getS_regdate()="
				+ getS_regdate() + ", getS_ok()=" + getS_ok() + "]";
	}
}
