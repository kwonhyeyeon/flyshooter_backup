package com.fly.user.stadium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.member.stadium.vo.StadiumVO;
import com.fly.user.stadium.dao.UserStadiumDao;

@Service("userStadiumService")
public class UserStadiumServiceImpl implements UserStadiumService {

	@Autowired
	@Qualifier("userStadiumDao")
	private UserStadiumDao stadiumDao;
	
	@Override
	public List<StadiumVO> selectStadiumList(String p_num) {
		// TODO Auto-generated method stub
		return stadiumDao.selectStadiumList(p_num);
	}

	@Override
	public StadiumVO getSelectedStadiumInfo(int s_no) {
		// TODO Auto-generated method stub
		return stadiumDao.getSelectedStadiumInfo(s_no);
	}

}
