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
	public List<CalculateVO> CalculateList(String m_id) {
		// TODO Auto-generated method stub
		return calculateDao.CalculateList(m_id);
	}

	@Override
	public int CalculateInsert(CalculateVO cvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			calculateDao.CalculateInsert(cvo);
			result = 1;//성공
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = 2;//실패
		}
		return result;
	}

}
