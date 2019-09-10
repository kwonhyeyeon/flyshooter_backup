package com.fly.client.items.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.items.vo.ItemsVO;
@Repository("itemsDao")
public class ItemsDaoImpl implements ItemsDao {
	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.client.items.dao.ItemsDao";
	
	@Override
	public List<ItemsVO> searchItemsList(String p_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".selectItemsList", p_num);
	}

}
