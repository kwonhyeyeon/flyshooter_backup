package com.fly.rental.detail.vo;

import com.fly.member.rental.vo.RentalVO;

public class RentalDetailVO extends RentalVO{
	
	private String p_name;
	private String p_address;
	private String p_intro;
	private String p_phone;
	private String s_name;
	private int s_hours;
	private String s_img1;
	private String s_img2;
	private String s_img3;
	private String m_name;
	private String m_phone;
	private int itemsCnt;
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_address() {
		return p_address;
	}
	public void setP_address(String p_address) {
		this.p_address = p_address;
	}
	public String getP_intro() {
		return p_intro;
	}
	public void setP_intro(String p_intro) {
		this.p_intro = p_intro;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_hours() {
		return s_hours;
	}
	public void setS_hours(int s_hours) {
		this.s_hours = s_hours;
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
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getItemsCnt() {
		return itemsCnt;
	}
	public void setItemsCnt(int itemsCnt) {
		this.itemsCnt = itemsCnt;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	@Override
	public String toString() {
		System.out.println(super.toString() + "======paging=====");
		return "RentalDetailVO [getP_name()=" + getP_name() + ", getP_address()=" + getP_address() + ", getP_intro()="
				+ getP_intro() + ", getS_name()=" + getS_name() + ", getS_hours()=" + getS_hours() + ", getS_img1()="
				+ getS_img1() + ", getS_img2()=" + getS_img2() + ", getS_img3()=" + getS_img3() + ", getM_name()="
				+ getM_name() + ", getM_phone()=" + getM_phone() + ", getItemsCnt()=" + getItemsCnt()
				+ ", getP_phone()=" + getP_phone() + "]";
	}
	
	
	
	
	
}
