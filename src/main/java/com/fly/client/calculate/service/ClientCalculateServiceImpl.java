package com.fly.client.calculate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.client.calculate.dao.ClientCalculateDao;
import com.fly.client.calculate.vo.CalculateVO;


@Service("calculateService")
@Transactional
public class ClientCalculateServiceImpl implements ClientCalculateService{

	@Autowired
	@Qualifier("calculateDao")
	private ClientCalculateDao calculateDao;

	@Override
	public List<CalculateVO> calculateList(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return calculateDao.calculateList(cvo);
	}

	@Override
	@Transactional
	public int calculateInsert(CalculateVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			calculateDao.calculateInsert(cvo);
			calculateDao.pRentalUpdae(cvo);
			result = 1;//성공
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = 2;//실패
		}
		return result;
	}

	@Override
	public List<CalculateVO> calculateIList(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return calculateDao.calculateIList(cvo);
	}

	@Override
	public int pageingSize(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return calculateDao.pageingSize(cvo);
	}

}
