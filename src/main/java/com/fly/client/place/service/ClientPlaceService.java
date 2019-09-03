package com.fly.client.place.service;

import java.util.List;

import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

public interface ClientPlaceService {

	// 구장별 대관 예약 현황
	public List<StadiumVO> stadiumList(String p_name);
	
}
