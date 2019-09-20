package com.fly.client.calculate.service;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface ClientCalculateService {

	List<CalculateVO> CalculateList(String m_id);

	int CalculateInsert(CalculateVO cvo);

}
