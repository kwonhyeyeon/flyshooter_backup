package com.fly.admin.status.service;

import java.util.List;

import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;
import com.fly.admin.status.vo.AdminPlaceStatusVO;

public interface AdminPlaceStatusService {
		// 구장 등록 현황 리스트
		public List<AdminPlaceStatusVO> selectPlace(AdminPlaceStatusVO svo);
		
}
