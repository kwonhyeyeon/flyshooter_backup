package com.fly.member.support.vo;

import com.fly.member.common.vo.CommonVO;

public class SupportVO extends CommonVO {

	private int hs_no = 0; // 용병지원 게시글 일련번호
	private String m_id; // 회원 아이디
	private String hs_area; // 지역
	private String hs_date; // 가능 일자
	private String hs_time; // 가능 시간
	private int hs_people; // 인원 수
	private int hs_level; // 팀 수준
	private String hs_etc; // 비고
	private String hs_regdate; // 작성일자
	private int hs_progress; // 진행 상태
	private int hs_status; // 게시물 상태

	private String m_name; // 회원 이름
	private String m_phone; // 회원 전화번호

	public int getHs_no() {
		return hs_no;
	}

	public void setHs_no(int hs_no) {
		this.hs_no = hs_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getHs_area() {
		return hs_area;
	}

	public void setHs_area(String hs_area) {
		this.hs_area = hs_area;
	}

	public String getHs_date() {
		return hs_date;
	}

	public void setHs_date(String hs_date) {
		this.hs_date = hs_date;
	}

	public String getHs_time() {
		return hs_time;
	}

	public void setHs_time(String hs_time) {
		this.hs_time = hs_time;
	}

	public int getHs_people() {
		return hs_people;
	}

	public void setHs_people(int hs_people) {
		this.hs_people = hs_people;
	}

	public int getHs_level() {
		return hs_level;
	}

	public void setHs_level(int hs_level) {
		this.hs_level = hs_level;
	}

	public String getHs_etc() {
		return hs_etc;
	}

	public void setHs_etc(String hs_etc) {
		this.hs_etc = hs_etc;
	}

	public String getHs_regdate() {
		return hs_regdate;
	}

	public void setHs_regdate(String hs_regdate) {
		this.hs_regdate = hs_regdate;
	}

	public int getHs_progress() {
		return hs_progress;
	}

	public void setHs_progress(int hs_progress) {
		this.hs_progress = hs_progress;
	}

	public int getHs_status() {
		return hs_status;
	}

	public void setHs_status(int hs_status) {
		this.hs_status = hs_status;
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

	@Override
	public String toString() {
		return "SupportVO [getHs_no()=" + getHs_no() + ", getM_id()=" + getM_id() + ", getHs_area()=" + getHs_area()
				+ ", getHs_date()=" + getHs_date() + ", getHs_time()=" + getHs_time() + ", getHs_people()="
				+ getHs_people() + ", getHs_level()=" + getHs_level() + ", getHs_etc()=" + getHs_etc()
				+ ", getHs_regdate()=" + getHs_regdate() + ", getHs_progress()=" + getHs_progress()
				+ ", getHs_status()=" + getHs_status() + ", getM_name()=" + getM_name() + ", getM_phone()="
				+ getM_phone() + "]";
	}

}
