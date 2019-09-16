package com.fly.client.stadium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.client.stadium.dao.ClientStadiumDao;
import com.fly.member.stadium.vo.StadiumVO;

@Service("stadiumService")
@Transactional
public class ClientStadiumServiceImpl implements ClientStadiumService {

	@Autowired
	@Qualifier("clientStadiumDao")
	private ClientStadiumDao clientStadiumDao;
	
	@Override
	public List<StadiumVO> StadiumList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StadiumVO StadiumDetail(String s_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int StadiumInsert(StadiumVO svo) {
		// TODO Auto-generated method stub
		int result = clientStadiumDao.stadiumInsert(svo);
		return result;
	}

	@Override
	public int StadiumModify(StadiumVO svo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
