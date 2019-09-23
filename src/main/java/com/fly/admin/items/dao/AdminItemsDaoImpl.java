package com.fly.admin.items.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.items.vo.ItemsVO;

@Repository("adminItemsDao")
public class AdminItemsDaoImpl implements AdminItemsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.admin.items.dao.AdminItemsDao";

	@Override
	public List<ItemsVO> getItemsList(ItemsVO ivo) {
		return sqlSession.selectList(NAME_SPACE + ".getItemsList", ivo);
	}

}
