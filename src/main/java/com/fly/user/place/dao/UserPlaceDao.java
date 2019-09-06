package com.fly.user.place.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.fly.client.place.vo.PlaceVO;

public interface UserPlaceDao {
	// 지역으로 검색한 구장리스트
	public List<PlaceVO> searchPlaceList(String area);
	// 선택된 구장의 정보
	public PlaceVO selectPlace(String p_num);
}
