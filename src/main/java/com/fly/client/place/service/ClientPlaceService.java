package com.fly.client.place.service;

import java.util.List;

import com.fly.member.place.vo.PlaceVO;
//import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

public interface ClientPlaceService {
	// 구장 리스트 출력
	public List<PlaceVO> placeList();
	// 구장별 대관 예약 현황
	public List<StadiumVO> stadiumList(String p_name);

	
	
	
}
