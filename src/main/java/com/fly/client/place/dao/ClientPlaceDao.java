package com.fly.client.place.dao;

import java.util.List;

import com.fly.member.stadium.vo.StadiumVO;

public interface ClientPlaceDao {

	// 구장별 경기장 리스트
	public List<StadiumVO> stadiumList(String p_name);
	
}
