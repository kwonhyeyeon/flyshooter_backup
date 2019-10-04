package com.fly.client.stats.dao;


import java.util.List;

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

	@Override
	public List<Integer> selectStadiumNo(StatsVO stvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".selectStadiumNo", stvo);
	}

	@Override
	public String stadiumStatus(StatsVO stvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".stadiumStatic", stvo);
	}

	@Override
	public String allPlaceSales(StatsVO stvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".salesAllPlace", stvo);
	}
	

}
