package com.fly.client.place.dao;

import com.fly.client.place.vo.PlaceVO;

public interface PlaceDAO {

	// 지역 검색
	public PlaceVO areaSearch(String area);
	
}
