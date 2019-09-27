package com.fly.admin.rentalstatus.dao;

import java.util.List;

import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;

public interface AdminRentalStatusDao {
	// 월별 예약 현황
	public List<AdminRentalStatusVO> selectRental(AdminRentalStatusVO rvo);
}
