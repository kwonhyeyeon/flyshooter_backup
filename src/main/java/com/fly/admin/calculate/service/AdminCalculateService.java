package com.fly.admin.calculate.service;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface AdminCalculateService {

	List<CalculateVO> adminCalculateList(CalculateVO cvo);

	int adminCalculateUpdate(int c_no);

	int adminCRentalUpdate(String p_num);

	int pageingSize(CalculateVO cvo);

}
