package com.fly.admin.status.dao;

import java.util.List;

import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;
import com.fly.admin.status.vo.AdminPlaceStatusVO;

public interface AdminPlaceStatusDao {
	// 구장 등록 현황 리스트
	public List<AdminPlaceStatusVO> selectPlace(AdminPlaceStatusVO svo);
	
}
