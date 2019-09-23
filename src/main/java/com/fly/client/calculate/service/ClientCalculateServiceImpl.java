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
	public List<CalculateVO> calculateList(String m_id) {
		// TODO Auto-generated method stub
		return calculateDao.calculateList(m_id);
	}

	@Override
	public int calculateInsert(CalculateVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			calculateDao.calculateInsert(cvo);
			result = 1;//성공
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = 2;//실패
		}
		return result;
	}

	@Override
	public List<CalculateVO> calculateIList(String m_id) {
		// TODO Auto-generated method stub
		return calculateDao.calculateIList(m_id);
	}

	@Override
	public int pRentalUpdae(String p_num) {
		// TODO Auto-generated method stub
		return calculateDao.pRentalUpdae(p_num);
	}

}
