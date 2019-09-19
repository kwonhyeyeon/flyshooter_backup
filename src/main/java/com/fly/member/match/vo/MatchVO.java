package com.fly.member.match.vo;

import com.fly.member.common.vo.CommonVO;

public class MatchVO extends CommonVO {

	private int mb_no = 0; // 매치 게시글 일련번호
	private String m_id; // 회원 아이디
	private String mb_type; // 매치 형태
	private String mb_name; // 구장명
	private String mb_address; // 구장 주소
	private String mb_stadium; // 경기장

	private String mb_m_date; // 매치 일자

	private String mb_time; // 경기 시간
	private String mb_uniform; // 유니폼
	private int mb_level; // 팀 수준
	private String mb_etc; // 비고

	private String mb_regdate; // 작성일자

	private int mb_progress; // 진행 상태
	private int mb_status; // 게시물 상태

	private String m_name; // 회원 이름
	private String m_phone; // 회원 전화번호

	public MatchVO() {
		super();
	}

	public String getMb_m_date() {
		return mb_m_date;
	}

	public void setMb_m_date(String mb_m_date) {
		this.mb_m_date = mb_m_date;
	}

	public String getMb_regdate() {
		return mb_regdate;
	}

	public void setMb_regdate(String mb_regdate) {
		this.mb_regdate = mb_regdate;
	}

	public int getMb_no() {
		return mb_no;
	}

	public void setMb_no(int mb_no) {
		this.mb_no = mb_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getMb_type() {
		return mb_type;
	}

	public void setMb_type(String mb_type) {
		this.mb_type = mb_type;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_address() {
		return mb_address;
	}

	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}

	public String getMb_stadium() {
		return mb_stadium;
	}

	public void setMb_stadium(String mb_stadium) {
		this.mb_stadium = mb_stadium;
	}

	public String getMb_time() {
		return mb_time;
	}

	public void setMb_time(String mb_time) {
		this.mb_time = mb_time;
	}

	public String getMb_uniform() {
		return mb_uniform;
	}

	public void setMb_uniform(String mb_uniform) {
		this.mb_uniform = mb_uniform;
	}

	public int getMb_level() {
		return mb_level;
	}

	public void setMb_level(int mb_level) {
		this.mb_level = mb_level;
	}

	public String getMb_etc() {
		return mb_etc;
	}

	public void setMb_etc(String mb_etc) {
		this.mb_etc = mb_etc;
	}

	public int getMb_progress() {
		return mb_progress;
	}

	public void setMb_progress(int mb_progress) {
		this.mb_progress = mb_progress;
	}

	public int getMb_status() {
		return mb_status;
	}

	public void setMb_status(int mb_status) {
		this.mb_status = mb_status;
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


	// 종료

}
