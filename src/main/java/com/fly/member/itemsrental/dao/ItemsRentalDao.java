package com.fly.member.itemsrental.dao;

import com.fly.member.itemsrental.vo.ItemsRentalVO;

public interface ItemsRentalDao {
	
	// 대관시 선택된 옵션정보 insert
	public int itemsRentalInsert(ItemsRentalVO irvo);
}
