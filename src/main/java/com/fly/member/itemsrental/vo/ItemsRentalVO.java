package com.fly.member.itemsrental.vo;

import com.fly.client.items.vo.ItemsVO;

public class ItemsRentalVO extends ItemsVO {

	private int ir_no; // 용품대여 일련번호
	private int i_no; // 용품 일련번호
	private int r_no; // 대여 일련번호
	private int ir_return_status; // 반납 상태
	private int ir_rental_ea; // 대여 수량
	
	public int getIr_no() {
		return ir_no;
	}
	public void setIr_no(int ir_no) {
		this.ir_no = ir_no;
	}
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getIr_return_status() {
		return ir_return_status;
	}
	public void setIr_return_status(int ir_return_status) {
		this.ir_return_status = ir_return_status;
	}
	public int getIr_rental_ea() {
		return ir_rental_ea;
	}
	public void setIr_rental_ea(int ir_rental_ea) {
		this.ir_rental_ea = ir_rental_ea;
	}
	@Override
	public String toString() {
		return "ItemsRentalVO [getIr_no()=" + getIr_no() + ", getI_no()=" + getI_no() + ", getR_no()=" + getR_no()
				+ ", getIr_return_status()=" + getIr_return_status() + ", getIr_rental_ea()=" + getIr_rental_ea() + "]";
	}
	
}
