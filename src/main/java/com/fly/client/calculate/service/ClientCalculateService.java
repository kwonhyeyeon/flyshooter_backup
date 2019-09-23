package com.fly.client.calculate.service;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface ClientCalculateService {

	List<CalculateVO> calculateList(String m_id);

	int calculateInsert(CalculateVO cvo);

	List<CalculateVO> calculateIList(String m_id);

	int pRentalUpdae(String p_num);

}
