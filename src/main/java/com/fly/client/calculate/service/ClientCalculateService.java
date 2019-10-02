package com.fly.client.calculate.service;

import java.util.List;

import com.fly.client.calculate.vo.CalculateVO;

public interface ClientCalculateService {

	List<CalculateVO> calculateList(CalculateVO cvo);

	int calculateInsert(CalculateVO cvo);

	List<CalculateVO> calculateIList(CalculateVO cvo);

	int pageingSize(CalculateVO cvo);

}
