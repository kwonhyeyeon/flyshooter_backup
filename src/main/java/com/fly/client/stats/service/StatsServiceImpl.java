package com.fly.client.stats.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fly.client.stats.dao.StatsDao;
import com.fly.client.stats.vo.StatsVO;

public class StatsServiceImpl implements StatsService{

	@Autowired
	@Qualifier("StatsDao")
	private StatsDao statsDao;

	//통계
	@Override
	public List<StatsVO> stadiumstats(StatsVO stvo) {
		List<StatsVO> stlist = statsDao.stadiumstats(stvo);
		return stlist;
	}

}
