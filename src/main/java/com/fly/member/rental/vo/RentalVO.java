package com.fly.member.rental.vo;

import com.fly.paging.vo.PagingVO;

public class RentalVO extends PagingVO {

	private int r_no; // 대관 일련번호
	private int s_no; // 경기장 일련번호
	private String m_id; // 회원 ID
	private String r_reserve_date; // 예약일자
	private String r_start; // 예약 시작 시간
	private int r_total_pay; // 총 결제 금액
	private int r_pay_type; // 결제 유형
	private String r_bank; // 환불 은행명
	private String r_account; // 환불 예금주명
	private String r_account_num; // 환불 계좌번호
	private int r_pay_status; // 결제 상태
	private String r_regdate; // 대관 신청 시간
	private String r_recall_time; // 환불 신청 이랒
	private int refund; // 환불 금액
	private int cal_status; // 환불 지급 상태
	
	
	
	
	public RentalVO() {
		super();
	}
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getR_reserve_date() {
		return r_reserve_date;
	}
	public void setR_reserve_date(String r_reserve_date) {
		this.r_reserve_date = r_reserve_date;
	}
	public String getR_start() {
		return r_start;
	}
	public void setR_start(String r_start) {
		this.r_start = r_start;
	}
	public int getR_total_pay() {
		return r_total_pay;
	}
	public void setR_total_pay(int r_total_pay) {
		this.r_total_pay = r_total_pay;
	}
	public int getR_pay_type() {
		return r_pay_type;
	}
	public void setR_pay_type(int r_pay_type) {
		this.r_pay_type = r_pay_type;
	}
	public String getR_bank() {
		return r_bank;
	}
	public void setR_bank(String r_bank) {
		this.r_bank = r_bank;
	}
	public String getR_account() {
		return r_account;
	}
	public void setR_account(String r_account) {
		this.r_account = r_account;
	}
	public String getR_account_num() {
		return r_account_num;
	}
	public void setR_account_num(String r_account_num) {
		this.r_account_num = r_account_num;
	}
	public int getR_pay_status() {
		return r_pay_status;
	}
	public void setR_pay_status(int r_pay_status) {
		this.r_pay_status = r_pay_status;
	}
	public String getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}
	public String getR_recall_time() {
		return r_recall_time;
	}
	public void setR_recall_time(String r_recall_time) {
		this.r_recall_time = r_recall_time;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getCal_status() {
		return cal_status;
	}
	public void setCal_status(int cal_status) {
		this.cal_status = cal_status;
	}
	@Override
	public String toString() {
		return "RentalVO [getR_no()=" + getR_no() + ", getS_no()=" + getS_no() + ", getM_id()=" + getM_id()
				+ ", getR_reserve_date()=" + getR_reserve_date() + ", getR_start()=" + getR_start()
				+ ", getR_total_pay()=" + getR_total_pay() + ", getR_pay_type()=" + getR_pay_type() + ", getR_bank()="
				+ getR_bank() + ", getR_account()=" + getR_account() + ", getR_account_num()=" + getR_account_num()
				+ ", getR_pay_status()=" + getR_pay_status() + ", getR_regdate()=" + getR_regdate()
				+ ", getR_recall_time()=" + getR_recall_time() + ", getRefund()=" + getRefund() + ", getCal_status()="
				+ getCal_status() + "]";
	}
	
	
}
