package com.fly.client.stats.service;

import java.util.List;




import com.fly.client.stats.vo.StatsVO;


public interface StatsService {
	//통계
	public String placeStatus(StatsVO stvo);
	
	// 구장에 등록된 경기장일련번호 select
	public List<Integer> selectStadiumNo(StatsVO stvo);
	
	// 경기장 통계
	public String stadiumStatus(StatsVO stvo);
	
	// 전체구장 매출통계
	public String allPlaceSales(StatsVO stvo);
	
	// 선택된 구장의 경기장 매출통계
	public String selectedStadiumSales(StatsVO stvo);
}
