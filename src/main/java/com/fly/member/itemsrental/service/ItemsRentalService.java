package com.fly.member.itemsrental.service;

import java.util.List;

import com.fly.member.itemsrental.vo.ItemsRentalVO;

public interface ItemsRentalService {

	// 대관일련번호로 등록된 대여된 아이템리스트
	public List<ItemsRentalVO> getItemsRentalList(int r_no);
}
