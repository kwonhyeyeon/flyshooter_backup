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
	
	@Override
	public List<ItemsVO> itemsList(String p_num) {
		// TODO Auto-generated method stub
		return itemsDao.itemsList(p_num);
	}

	@Override
	public int itemDelete(String i_no) {
		// TODO Auto-generated method stub
		return itemsDao.itemDelete(i_no);
	}

	@Override
	public int itemActive(String i_no) {
		// TODO Auto-generated method stub
		return itemsDao.itemActive(i_no);
	}

	@Override
	public int itemUnActive(String i_no) {
		// TODO Auto-generated method stub
		return itemsDao.itemUnActive(i_no);
	}

	@Override
	public void itemInsert(ItemsVO ivo) {
		// TODO Auto-generated method stub
		itemsDao.itemInsert(ivo);
	}

}
