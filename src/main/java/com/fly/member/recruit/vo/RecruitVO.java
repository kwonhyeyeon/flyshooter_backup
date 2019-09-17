package com.fly.member.recruit.vo;

import com.fly.member.common.vo.CommonVO;

public class RecruitVO extends CommonVO {

	private int hr_no = 0; // 용병모집 게시글 일련번호
	private String m_id; // 회원 아이디
	private String hr_name; // 구장명
	private String hr_stadium; // 경기장
	private String hr_address; // 경기장 주소

	private String hr_m_date; // 매치 일자

	private String hr_time; // 경기 시간
	private String hr_m_type; // 매치 형태
	private String hr_nuiform; // 유니폼

	private int hr_level; // 팀 수준

	private int hr_people; // 모집인원
	private String hr_etc; // 비고
	private String hr_regdate; // 작성일자

	private int hr_progress; // 진행 상태
	private int hr_status; // 게시물 상태

	private String m_name; // 회원 이름
	private String m_phone; // 회원 전화번호

	public int getHr_no() {
		return hr_no;
	}

	public void setHr_no(int hr_no) {
		this.hr_no = hr_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getHr_name() {
		return hr_name;
	}

	public void setHr_name(String hr_name) {
		this.hr_name = hr_name;
	}

	public String getHr_stadium() {
		return hr_stadium;
	}

	public void setHr_stadium(String hr_stadium) {
		this.hr_stadium = hr_stadium;
	}

	public String getHr_address() {
		return hr_address;
	}

	public void setHr_address(String hr_address) {
		this.hr_address = hr_address;
	}

	public String getHr_m_date() {
		return hr_m_date;
	}

	public void setHr_m_date(String hr_m_date) {
		this.hr_m_date = hr_m_date;
	}

	public String getHr_time() {
		return hr_time;
	}

	public void setHr_time(String hr_time) {
		this.hr_time = hr_time;
	}

	public String getHr_m_type() {
		return hr_m_type;
	}

	public void setHr_m_type(String hr_m_type) {
		this.hr_m_type = hr_m_type;
	}

	public String getHr_nuiform() {
		return hr_nuiform;
	}

	public void setHr_nuiform(String hr_nuiform) {
		this.hr_nuiform = hr_nuiform;
	}

	public int getHr_level() {
		return hr_level;
	}

	public void setHr_level(int hr_level) {
		this.hr_level = hr_level;
	}

	public int getHr_people() {
		return hr_people;
	}

	public void setHr_people(int hr_people) {
		this.hr_people = hr_people;
	}

	public String getHr_etc() {
		return hr_etc;
	}

	public void setHr_etc(String hr_etc) {
		this.hr_etc = hr_etc;
	}

	public String getHr_regdate() {
		return hr_regdate;
	}

	public void setHr_regdate(String hr_regdate) {
		this.hr_regdate = hr_regdate;
	}

	public int getHr_progress() {
		return hr_progress;
	}

	public void setHr_progress(int hr_progress) {
		this.hr_progress = hr_progress;
	}

	public int getHr_status() {
		return hr_status;
	}

	public void setHr_status(int hr_status) {
		this.hr_status = hr_status;
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

}
