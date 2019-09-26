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
	//상세보기
	@Override
	public StadiumVO stadiumDetail(String s_no) {
		// TODO Auto-generated method stub
		return clientStadiumDao.stadiumDetail(s_no);
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
	//경기장 수정
	@Override
	public int stadiumModify(StadiumVO svo) {
		int result = 0;
		
		try {
			result = clientStadiumDao.stadiumModify(svo);
			System.out.println(result+"결과");
			System.out.println(svo.toString());
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	@Override
	public int closeStadium(String s_no) {
		int result = 0;
		result = clientStadiumDao.closeStadium(s_no);
		if (result > 0) {
			result = 1;
		}else {
			result = 0;
		}
		return result;
	}

}
