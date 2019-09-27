package com.fly.admin.calculate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.admin.calculate.dao.AdminCalculateDao;
import com.fly.client.calculate.vo.CalculateVO;

@Service("adminCalculateService")
public class AdminCalculateServiceImpl implements AdminCalculateService{

	@Autowired
	@Qualifier("adminCalculateDao")
	private AdminCalculateDao adminCalculateDao;

	@Override
	public List<CalculateVO> adminCalculateList(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return adminCalculateDao.adminCalculateList(cvo);
	}

	@Override
	public int adminCalculateUpdate(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return adminCalculateDao.adminCalculateUpdate(cvo);
	}

	@Override
	public int adminCRentalUpdate(String p_num) {
		// TODO Auto-generated method stub
		return adminCalculateDao.adminCRentalUpdate(p_num);
	}

	@Override
	public int pageingSize(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return adminCalculateDao.pageingSize(cvo);
	}
}
