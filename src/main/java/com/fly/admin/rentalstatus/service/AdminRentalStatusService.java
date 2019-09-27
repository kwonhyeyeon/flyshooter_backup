package com.fly.admin.rentalstatus.service;

import java.util.List;

import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;

public interface AdminRentalStatusService {
	// 월별 예약 현황
	public List<AdminRentalStatusVO> selectRental(AdminRentalStatusVO rvo);
}
