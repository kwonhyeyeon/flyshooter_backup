package com.fly.client.stats.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.stats.vo.StatsVO;

@Repository("StatsDao")
public class StatsDaoImpl implements StatsDao{

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.client.stats.dao.StatsDao";

	//통계
	@Override
	public String placeStatus(StatsVO stvo) {
		return sqlSession.selectOne(NAME_SPACE + ".placeStatic", stvo);
	}
	

}
