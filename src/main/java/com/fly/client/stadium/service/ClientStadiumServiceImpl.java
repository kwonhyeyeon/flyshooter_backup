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
	public List<StadiumVO> stadiumList(String p_num) {
		// TODO Auto-generated method stub
		List<StadiumVO> list = clientStadiumDao.stadiumList(p_num);
		return list;
	}

	@Override
	public StadiumVO stadiumDetail(int s_no) {
		// TODO Auto-generated method stub
		StadiumVO svo = clientStadiumDao.stadiumDetail(s_no);
		return svo;
	}

	@Override
	public int stadiumInsert(StadiumVO svo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result =  clientStadiumDao.stadiumInsert(svo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}

	@Override
	public int stadiumModify(StadiumVO svo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
