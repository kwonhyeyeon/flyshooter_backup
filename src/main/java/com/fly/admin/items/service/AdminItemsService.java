package com.fly.admin.items.service;

import java.util.List;

import com.fly.client.items.vo.ItemsVO;

public interface AdminItemsService {

	// 용품 리스트 출력
	public List<ItemsVO> getItemsList(ItemsVO ivo);
	
}
