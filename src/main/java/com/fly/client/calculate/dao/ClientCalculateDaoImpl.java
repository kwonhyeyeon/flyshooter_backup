package com.fly.client.calculate.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.calculate.vo.CalculateVO;

@Repository("calculateDao")
public class ClientCalculateDaoImpl implements ClientCalculateDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CalculateVO> CalculateList(String m_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("calculateList", m_id);
	}

	@Override
	public int CalculateInsert(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("calculateInsert", cvo);
	}

}
