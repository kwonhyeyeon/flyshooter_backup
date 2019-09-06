package com.fly.user.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.client.place.vo.PlaceVO;
import com.fly.user.place.dao.UserPlaceDao;


@Service("userPlaceService")
public class UserPlaceServiceImpl implements UserPlaceService {

	@Autowired
	@Qualifier("placeDao")
	private UserPlaceDao placeDao;
	
	@Override
	public List<PlaceVO> searchPlaceList(String area) {
		// TODO Auto-generated method stub
		return placeDao.searchPlaceList(area);
	}

	@Override
	public PlaceVO selectPlace(String p_num) {
		// TODO Auto-generated method stub
		return placeDao.selectPlace(p_num);
	}

}
