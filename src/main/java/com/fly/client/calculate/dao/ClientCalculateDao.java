package com.fly.client.calculate.dao;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface ClientCalculateDao {

	List<CalculateVO> CalculateList(String m_id);

	int CalculateInsert(CalculateVO cvo);

}
