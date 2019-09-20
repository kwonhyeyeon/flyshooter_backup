package com.fly.member.itemsrental.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.itemsrental.vo.ItemsRentalVO;
@Repository("itemsRentalDao")
public class ItemsRentalDaoImpl implements ItemsRentalDao {
	
	@Autowired
	private SqlSession session;
	private String NAME_SPACE = "com.fly.member.itemsrental.dao.ItemsRentalDao";
	
	@Override
	public int itemsRentalInsert(ItemsRentalVO irvo) {
		// TODO Auto-generated method stub
		return session.insert(NAME_SPACE + ".itemsRentalInsert", irvo);
	}

	@Override
	public List<ItemsRentalVO> getItemsRentalList(int r_no) {
		// TODO Auto-generated method stub
		return session.selectList(NAME_SPACE + ".getItemsRentalList", r_no);
	}

}
