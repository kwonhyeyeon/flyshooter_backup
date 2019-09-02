package com.fly.user.place.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fly.member.place.vo.PlaceVO;
import com.fly.user.place.dao.PlaceDao;

public interface PlaceService {
	
	// 지역으로 검색한 구장리스트
	public List<PlaceVO> searchPlaceList(String area);
	
}
