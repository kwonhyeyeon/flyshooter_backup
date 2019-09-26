package com.fly.client.stats.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.stats.vo.StatsVO;

@Repository("StatsDao")
public class StatsDaoImpl implements StatsDao{

	@Autowired
	private SqlSession session;
	
	private String NAME_SPACE = "com.fly.client.stats.dao.StatsDao";

	//통계
	@Override
	public List<StatsVO> stadiumstats(StatsVO stvo) {
		return session.selectList(NAME_SPACE + ".stadiumstats", stvo);
	}
	

}
