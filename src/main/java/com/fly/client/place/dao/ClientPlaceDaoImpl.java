package com.fly.client.place.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fly.client.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

@Repository("clientPlaceDao")
public class ClientPlaceDaoImpl implements ClientPlaceDao {
	
	@Autowired
	private SqlSession session;
	
	private String NAME_SPACE = "com.fly.client.place.dao.ClientPlaceDao";

	// 구장 리스트
	@Override
	public List<PlaceVO> placeList(String m_id) {
		return session.selectList("placeList", m_id);
	}
	
	// 경기장 리스트
	@Override
	public List<StadiumVO> stadiumList(String p_num) {
		return session.selectList(NAME_SPACE + ".stadiumList", p_num);
	}
	
	// 대관 예약 리스트
	@Override
	public List<RentalVO> rentalList(HashMap<String, Object> map) {
		return session.selectList("rentalList", map);
	}

}
