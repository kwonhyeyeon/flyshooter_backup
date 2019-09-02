package com.fly.client.place.service;

import java.util.List;

import com.fly.member.rental.vo.RentalVO;

public interface PlaceService {

	// 구장별 대관 예약 현황
	public List<RentalVO> placeRentalList(String p_name);
	
}
