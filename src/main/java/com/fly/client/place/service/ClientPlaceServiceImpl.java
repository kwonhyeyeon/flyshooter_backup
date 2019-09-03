package com.fly.client.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Qualifier;
=======
>>>>>>> 40299a269fce65f337823f3f163a5a74079df47d
import org.springframework.stereotype.Service;

import com.fly.client.place.dao.ClientPlaceDao;
import com.fly.member.stadium.vo.StadiumVO;

<<<<<<< HEAD
@Service("clientPlaceService")
public class ClientPlaceServiceImpl implements ClientPlaceService {
	
	@Autowired
	@Qualifier("clientPlaceDao")
=======
@Service
public class ClientPlaceServiceImpl implements ClientPlaceService {
	
	@Autowired
>>>>>>> 40299a269fce65f337823f3f163a5a74079df47d
	private ClientPlaceDao clientPlaceDao;

	// 구장별 경기장 리스트
	@Override
	public List<StadiumVO> stadiumList(String p_name) {
		return clientPlaceDao.stadiumList(p_name);
	}
<<<<<<< HEAD
=======

>>>>>>> 40299a269fce65f337823f3f163a5a74079df47d
}
