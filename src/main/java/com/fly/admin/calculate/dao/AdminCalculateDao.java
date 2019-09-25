package com.fly.admin.calculate.dao;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface AdminCalculateDao {

	List<CalculateVO> adminCalculateList(CalculateVO cvo);

	int adminCalculateUpdate(int c_no);

	int adminCRentalUpdate(String p_num);

	int pageingSize(CalculateVO cvo);

}
