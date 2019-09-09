package com.fly.client.place.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.client.place.dao.ClientPlaceDao;
import com.fly.client.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

@Service("clientPlaceService")
public class ClientPlaceServiceImpl implements ClientPlaceService {
	
	@Autowired
	@Qualifier("clientPlaceDao")
	private ClientPlaceDao clientPlaceDao;
	
	// 구장 리스트
	@Override
	public List<PlaceVO> placeList(String m_id) {
		List<PlaceVO> placeList = null;
		placeList = clientPlaceDao.placeList(m_id);
		
		return placeList;
	}
	
	// 경기장 리스트
	@Override
	public List<StadiumVO> stadiumList(String p_num) {
		List<StadiumVO> stadiumList = null;
		stadiumList = clientPlaceDao.stadiumList(p_num);
		
		return stadiumList;
	}

	// 대관 예약 리스트
	@Override
	public List<RentalVO> rentalList(int s_no, String r_reserve_date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("s_no", s_no);
		map.put("r_reserve_date", r_reserve_date);
		return clientPlaceDao.rentalList(map);
	}
	
}
