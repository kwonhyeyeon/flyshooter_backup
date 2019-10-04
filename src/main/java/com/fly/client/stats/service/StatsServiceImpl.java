package com.fly.client.stats.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.client.stats.dao.StatsDao;
import com.fly.client.stats.vo.StatsVO;
@Service("StatsService")	
public class StatsServiceImpl implements StatsService{
	
	@Autowired
	@Qualifier("StatsDao")
	private StatsDao statsDao;

	//통계
	@Override
	public String placeStatus(StatsVO stvo) {
		return statsDao.placeStatus(stvo);
	}

	@Override
	public List<Integer> selectStadiumNo(StatsVO stvo) {
		// TODO Auto-generated method stub
		return statsDao.selectStadiumNo(stvo);
	}

	@Override
	public String stadiumStatus(StatsVO stvo) {
		// TODO Auto-generated method stub
		return statsDao.stadiumStatus(stvo);
	}

	@Override
	public String allPlaceSales(StatsVO stvo) {
		// TODO Auto-generated method stub
		return statsDao.allPlaceSales(stvo);
	}

}
