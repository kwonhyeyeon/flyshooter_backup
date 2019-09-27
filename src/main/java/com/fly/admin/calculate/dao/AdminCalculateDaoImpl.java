package com.fly.admin.calculate.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.calculate.vo.CalculateVO;

@Repository("adminCalculateDao")
public class AdminCalculateDaoImpl implements AdminCalculateDao{
	
	@Autowired
	private SqlSession session;

	private String NAME_SPACE = "com.fly.admin.calculate.dao.AdminCalculateDao";
	
	@Override
	public List<CalculateVO> adminCalculateList(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList(NAME_SPACE + ".adminCalculateList", cvo);
	}

	@Override
	public int adminCalculateUpdate(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return session.update(NAME_SPACE + ".adminCalculateUpdate", cvo);
	}

	@Override
	public int adminCRentalUpdate(String p_num) {
		// TODO Auto-generated method stub
		return session.update(NAME_SPACE + ".adminCRentalUpdate", p_num);
	}

	@Override
	public int pageingSize(CalculateVO cvo) {
		// TODO Auto-generated method stub
		return session.selectOne(NAME_SPACE + ".pageingSize", cvo);
	}
	
}
