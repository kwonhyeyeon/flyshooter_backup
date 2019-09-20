package com.fly.member.itemsrental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.member.itemsrental.dao.ItemsRentalDao;
import com.fly.member.itemsrental.vo.ItemsRentalVO;

@Service("itemsRentalService")
public class ItemsRentalServiceImpl implements ItemsRentalService {

	
	@Autowired
	@Qualifier("itemsRentalDao")
	private ItemsRentalDao itemsRentalDao;

	@Override
	public List<ItemsRentalVO> getItemsRentalList(int r_no) {
		// TODO Auto-generated method stub
		return itemsRentalDao.getItemsRentalList(r_no);
	}
	
	
}
