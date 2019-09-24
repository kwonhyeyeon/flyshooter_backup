package com.fly.admin.items.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.admin.items.dao.AdminItemsDao;
import com.fly.client.items.vo.ItemsVO;

@Service("adminItemsService")
public class AdminItemsServiceImpl implements AdminItemsService {
	
	@Autowired
	@Qualifier("adminItemsDao")
	private AdminItemsDao adminItemsDao;

	@Override
	public List<ItemsVO> getItemsList(ItemsVO ivo) {
		return adminItemsDao.getItemsList(ivo);
	}

}
