package com.fly.member.place.vo;


import org.springframework.web.multipart.MultipartFile;

import com.fly.paging.vo.PagingVO;

public class PlaceVO extends PagingVO {

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
	private int p_holiday; // 정기휴일
	private int p_status = 2; // 구장 상태
	private String p_holiday_start; // 구장 임시휴업시작일
	private String p_holiday_end; // 구장 영업재개일
	private int p_ok; // 구장 승인상태
	private String p_ok_date; // 구장 승인일
	private String p_intro; // 소개글
	private String p_regdate; // 구장 등록일
	private MultipartFile file1;// 첨부파일
	private MultipartFile file2;// 첨부파일
	private MultipartFile file3;// 첨부파일
	

	
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

	public int getP_holiday() {
		return p_holiday;
	}


	public void setP_holiday(int p_holiday) {
		this.p_holiday = p_holiday;
	}


	public int getP_status() {
		return p_status;
	}


	public void setP_status(int p_status) {
		this.p_status = p_status;
	}



	public String getP_holiday_start() {
		return p_holiday_start;
	}



	public void setP_holiday_start(String p_holiday_start) {
		this.p_holiday_start = p_holiday_start;
	}



	public String getP_holiday_end() {
		return p_holiday_end;
	}

	public void setP_holiday_end(String p_holiday_end) {
		this.p_holiday_end = p_holiday_end;
	}

	public int getP_ok() {
		return p_ok;
	}


	public void setP_ok(int p_ok) {
		this.p_ok = p_ok;
	}

	public String getP_ok_date() {
		return p_ok_date;
	}

	public void setP_ok_date(String p_ok_date) {
		this.p_ok_date = p_ok_date;
	}

	public String getP_intro() {
		return p_intro;
	}


	public void setP_intro(String p_intro) {
		this.p_intro = p_intro;
	}

	public String getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}


	public MultipartFile getFile2() {
		return file2;
	}


	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}


	@Override
	public String toString() {
		return "PlaceVO [p_num=" + p_num + ", m_id=" + m_id + ", p_name=" + p_name + ", p_ceo=" + p_ceo + ", p_phone="
				+ p_phone + ", p_address=" + p_address + ", p_bank=" + p_bank + ", p_account=" + p_account
				+ ", p_account_num=" + p_account_num + ", p_open=" + p_open + ", p_close=" + p_close + ", p_file="
				+ p_file + ", p_register=" + p_register + ", p_account_copy=" + p_account_copy + ", p_property="
				+ p_property + ", p_holiday=" + p_holiday + ", p_status=" + p_status + ", p_holiday_start="
				+ p_holiday_start + ", p_holiday_end=" + p_holiday_end + ", p_ok=" + p_ok + ", p_ok_date=" + p_ok_date
				+ ", p_intro=" + p_intro + ", p_regdate=" + p_regdate + ", refund_day=" + "]";
	}
	
}
