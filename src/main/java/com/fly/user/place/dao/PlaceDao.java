package com.fly.user.place.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.fly.member.place.vo.PlaceVO;

public interface PlaceDao {
	// 지역으로 검색한 구장리스트
	public List<PlaceVO> searchPlaceList(String area);
}
