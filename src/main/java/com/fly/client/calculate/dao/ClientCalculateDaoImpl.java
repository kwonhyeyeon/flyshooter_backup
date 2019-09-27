package com.fly.client.calculate.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.calculate.vo.CalculateVO;

@Repository("calculateDao")
public class ClientCalculateDaoImpl implements ClientCalculateDao {

	@Autowired
	private SqlSession sqlSession;

	private String NAME_SPACE = "com.fly.client.calculate.dao.ClientCalculateDao";

	@Override
	public List<CalculateVO> calculateList(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".calculateList", cvo);
	}

	@Override
	public int calculateInsert(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAME_SPACE + ".calculateInsert", cvo);
	}

	@Override
	public List<CalculateVO> calculateIList(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".calculateIList", cvo);
	}

	@Override
	public int pRentalUpdae(String p_num) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAME_SPACE + ".pRentalUpdae", p_num);
	}

	@Override
	public int pageingSize(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".pageingSize", cvo);
	}

}
