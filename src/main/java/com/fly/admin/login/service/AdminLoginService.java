package com.fly.admin.login.service;

import java.util.List;

import com.fly.admin.statistics.vo.StatisticsVO;

public interface AdminLoginService {

	// admin 사이트 통계
	public List<StatisticsVO> getStatistics();
	
}
