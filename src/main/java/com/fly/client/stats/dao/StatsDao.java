package com.fly.client.stats.dao;

import java.util.List;

import com.fly.client.stats.vo.StatsVO;

public interface StatsDao {

	//통계
	public List<StatsVO>stadiumstats(StatsVO stvo);
}
