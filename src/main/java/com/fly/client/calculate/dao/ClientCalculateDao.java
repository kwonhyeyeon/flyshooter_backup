package com.fly.client.calculate.dao;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface ClientCalculateDao {

	List<CalculateVO> calculateList(CalculateVO cvo);

	int calculateInsert(CalculateVO cvo);

	List<CalculateVO> calculateIList(CalculateVO cvo);

	int pRentalUpdae(CalculateVO cvo);

	int pageingSize(CalculateVO cvo);

}
