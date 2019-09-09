package com.fly.client.items.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.client.items.dao.ItemsDao;
import com.fly.client.items.vo.ItemsVO;
@Service("itemsService")
public class ItemsServiceImpl implements ItemsService {

	@Autowired
	@Qualifier("itemsDao")
	private ItemsDao itemsDao;
	
	@Override
	public List<ItemsVO> searchItemsList(String p_num) {
		// TODO Auto-generated method stub
		return itemsDao.searchItemsList(p_num);
	}

}
