package com.fly.client.place.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.fly.client.place.vo.PlaceVO;

public class PlaceDAOImpl implements PlaceDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public PlaceVO areaSearch(String area) {
		return null;
	}

}
