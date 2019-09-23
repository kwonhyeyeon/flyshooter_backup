package com.fly.member.itemsrental.dao;

import java.util.List;

import com.fly.member.itemsrental.vo.ItemsRentalVO;

public interface ItemsRentalDao {
	
	// 대관시 선택된 옵션정보 insert
	public int itemsRentalInsert(ItemsRentalVO irvo);
	
	// 대관일련번호로 등록된 대여된 아이템리스트
	public List<ItemsRentalVO> getItemsRentalList(int r_no);
	
	// 대여된 아이템 반납여부 update
	public int updateStatus(ItemsRentalVO irvo);
}
