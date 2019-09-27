package com.fly.admin.rentalstatus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fly.admin.rentalstatus.dao.AdminRentalStatusDao;
import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;

@Service("AdminRentalStatusService")
public class AdminRentalStatusServiceImpl implements AdminRentalStatusService {

	@Autowired
	private AdminRentalStatusDao adminRentalStatusDao;

	@Override
	public List<AdminRentalStatusVO> selectRental(AdminRentalStatusVO rvo) {
		return adminRentalStatusDao.selectRental(rvo);
	}

}
