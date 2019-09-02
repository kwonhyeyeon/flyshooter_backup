package com.fly.client.place.dao;

import java.util.List;

import com.fly.member.rental.vo.RentalVO;

public interface PlaceDao {

	// 구장별 대관 예약 현황
	public List<RentalVO> placeRentalList(String p_name);
	
}
