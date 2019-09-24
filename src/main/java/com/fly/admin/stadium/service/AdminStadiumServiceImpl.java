package com.fly.admin.stadium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.admin.stadium.dao.AdminStadiumDao;
import com.fly.member.stadium.vo.StadiumVO;

@Service("adminStadiumService")
public class AdminStadiumServiceImpl implements AdminStadiumService {

	@Autowired()
	@Qualifier("adminStadiumDao")
	private AdminStadiumDao adminStadiumDao;

	@Override
	public List<StadiumVO> getStadiumList(StadiumVO svo) {
		return adminStadiumDao.getStadiumList(svo);
	}

	@Override
	public StadiumVO getStadiumDetail(int s_no) {
		return adminStadiumDao.getStadiumDetail(s_no);
	}

	@Override
	public void updateStdmAccept(int s_no) {
		adminStadiumDao.updateStdmAccept(s_no);
	}
	
}
