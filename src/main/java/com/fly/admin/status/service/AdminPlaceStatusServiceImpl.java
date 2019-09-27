package com.fly.admin.status.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.admin.status.dao.AdminPlaceStatusDao;
import com.fly.admin.status.vo.AdminPlaceStatusVO;

@Service("AdminPlaceStatusService")
public class AdminPlaceStatusServiceImpl implements AdminPlaceStatusService{

	@Autowired
	private AdminPlaceStatusDao adminPlaceStatusDao;
	
	@Override
	public List<AdminPlaceStatusVO> selectPlace(AdminPlaceStatusVO svo) {
		return adminPlaceStatusDao.selectPlace(svo);
	}

	
}
