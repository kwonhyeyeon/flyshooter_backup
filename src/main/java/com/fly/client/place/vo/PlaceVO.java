package com.fly.client.place.vo;

import java.util.Date;

public class PlaceVO {

	private String p_num; // 사업자번호
	private String m_id; // ID
	private String p_name; // 구장명
	private String p_ceo; // 대표자명
	private String p_phone; // 구장 전화번호
	private String p_address; // 구장 주소
	private String p_bank; // 은행명
	private String p_account; // 예금주명
	private String p_account_num; // 입금 계좌번호
	private String p_open; // 오픈시간
	private String p_close; // 마감시간
	private String p_file; // 서류 첨부유형
	private String p_register; // 사업자 등록증
	private String p_account_copy; // 통장사본
	private String p_property; // 부동산종합공부
	private Date p_holiday; // 정기휴일
	private int p_status; // 구장 상태
	private Date p_holiday_start; // 구장 임시휴업시작일
	private Date p_holiday_end; // 구장 영업재개일
	private int p_ok; // 구장 승인상태
	private Date p_ok_date; // 구장 승인일
	private String p_intro; // 소개글
	private Date p_regdate; // 구장 등록일
	
	public PlaceVO() {
		super();
	}
	
	public PlaceVO(String p_num, String m_id, String p_name, String p_ceo, String p_phone, String p_address,
			String p_bank, String p_account, String p_account_num, String p_open, String p_close, String p_file,
			String p_register, String p_account_copy, String p_property, Date p_holiday, int p_status,
			Date p_holiday_start, Date p_holiday_end, int p_ok, Date p_ok_date, String p_intro, Date p_regdate) {
		super();
		this.p_num = p_num;
		this.m_id = m_id;
		this.p_name = p_name;
		this.p_ceo = p_ceo;
		this.p_phone = p_phone;
		this.p_address = p_address;
		this.p_bank = p_bank;
		this.p_account = p_account;
		this.p_account_num = p_account_num;
		this.p_open = p_open;
		this.p_close = p_close;
		this.p_file = p_file;
		this.p_register = p_register;
		this.p_account_copy = p_account_copy;
		this.p_property = p_property;
		this.p_holiday = p_holiday;
		this.p_status = p_status;
		this.p_holiday_start = p_holiday_start;
		this.p_holiday_end = p_holiday_end;
		this.p_ok = p_ok;
		this.p_ok_date = p_ok_date;
		this.p_intro = p_intro;
		this.p_regdate = p_regdate;
	}
	
	// 사업자등록증, 통장사본, 부동산종합공부, 정기휴일 제외 생성자
	public PlaceVO(String p_num, String m_id, String p_name, String p_ceo, String p_phone, String p_address,
			String p_bank, String p_account, String p_account_num, String p_open, String p_close, String p_file,
			int p_status, Date p_holiday_start, Date p_holiday_end, int p_ok, Date p_ok_date, String p_intro,
			Date p_regdate) {
		super();
		this.p_num = p_num;
		this.m_id = m_id;
		this.p_name = p_name;
		this.p_ceo = p_ceo;
		this.p_phone = p_phone;
		this.p_address = p_address;
		this.p_bank = p_bank;
		this.p_account = p_account;
		this.p_account_num = p_account_num;
		this.p_open = p_open;
		this.p_close = p_close;
		this.p_file = p_file;
		this.p_status = p_status;
		this.p_holiday_start = p_holiday_start;
		this.p_holiday_end = p_holiday_end;
		this.p_ok = p_ok;
		this.p_ok_date = p_ok_date;
		this.p_intro = p_intro;
		this.p_regdate = p_regdate;
	}

	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_ceo() {
		return p_ceo;
	}
	public void setP_ceo(String p_ceo) {
		this.p_ceo = p_ceo;
	}
	public String getP_phone() {
		return p_phone;
	}
	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}
	public String getP_address() {
		return p_address;
	}
	public void setP_address(String p_address) {
		this.p_address = p_address;
	}
	public String getP_bank() {
		return p_bank;
	}
	public void setP_bank(String p_bank) {
		this.p_bank = p_bank;
	}
	public String getP_account() {
		return p_account;
	}
	public void setP_account(String p_account) {
		this.p_account = p_account;
	}
	public String getP_account_num() {
		return p_account_num;
	}
	public void setP_account_num(String p_account_num) {
		this.p_account_num = p_account_num;
	}
	public String getP_open() {
		return p_open;
	}
	public void setP_open(String p_open) {
		this.p_open = p_open;
	}
	public String getP_close() {
		return p_close;
	}
	public void setP_close(String p_close) {
		this.p_close = p_close;
	}
	public String getP_file() {
		return p_file;
	}
	public void setP_file(String p_file) {
		this.p_file = p_file;
	}
	public String getP_register() {
		return p_register;
	}
	public void setP_register(String p_register) {
		this.p_register = p_register;
	}
	public String getP_account_copy() {
		return p_account_copy;
	}
	public void setP_account_copy(String p_account_copy) {
		this.p_account_copy = p_account_copy;
	}
	public String getP_property() {
		return p_property;
	}
	public void setP_property(String p_property) {
		this.p_property = p_property;
	}
	public Date getP_holiday() {
		return p_holiday;
	}
	public void setP_holiday(Date p_holiday) {
		this.p_holiday = p_holiday;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	public Date getP_holiday_start() {
		return p_holiday_start;
	}
	public void setP_holiday_start(Date p_holiday_start) {
		this.p_holiday_start = p_holiday_start;
	}
	public Date getP_holiday_end() {
		return p_holiday_end;
	}
	public void setP_holiday_end(Date p_holiday_end) {
		this.p_holiday_end = p_holiday_end;
	}
	public int getP_ok() {
		return p_ok;
	}
	public void setP_ok(int p_ok) {
		this.p_ok = p_ok;
	}
	public Date getP_ok_date() {
		return p_ok_date;
	}
	public void setP_ok_date(Date p_ok_date) {
		this.p_ok_date = p_ok_date;
	}
	public String getP_intro() {
		return p_intro;
	}
	public void setP_intro(String p_intro) {
		this.p_intro = p_intro;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	
}