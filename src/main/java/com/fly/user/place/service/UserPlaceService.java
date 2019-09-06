package com.fly.user.place.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fly.client.place.vo.PlaceVO;
import com.fly.user.place.dao.UserPlaceDao;

public interface UserPlaceService {
	
	// 지역으로 검색한 구장리스트
	public List<PlaceVO> searchPlaceList(String area);
	
	// 선택된 구장의 정보
	public PlaceVO selectPlace(String p_num);
}
