package com.fly.client.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.client.place.dao.ClientPlaceDao;
import com.fly.member.stadium.vo.StadiumVO;

@Service("clientPlaceService")
public class ClientPlaceServiceImpl implements ClientPlaceService {
	
	@Autowired
	@Qualifier("clientPlaceDao")
	private ClientPlaceDao clientPlaceDao;

	// 구장별 경기장 리스트
	@Override
	public List<StadiumVO> stadiumList(String p_name) {
		return clientPlaceDao.stadiumList(p_name);
	}

}
