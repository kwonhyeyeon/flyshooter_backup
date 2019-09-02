package com.fly.client.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.rental.vo.RentalVO;

@Repository
public class PlaceDaoImpl implements PlaceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "com.fly.client.place.dao.PlaceDao";

	// 구장별 대관 예약 현황
	@Override
	public List<RentalVO> placeRentalList(String p_name) {
		return null;
	}

}
