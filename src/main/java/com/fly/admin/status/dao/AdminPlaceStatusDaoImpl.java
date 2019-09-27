package com.fly.admin.status.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;
import com.fly.admin.status.vo.AdminPlaceStatusVO;

@Repository("AdminPlaceStatusDao")
public class AdminPlaceStatusDaoImpl implements AdminPlaceStatusDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.admin.status.dao.AdminStatusDao";
	
	@Override
	public List<AdminPlaceStatusVO> selectPlace(AdminPlaceStatusVO svo) {
		return sqlSession.selectList(NAME_SPACE + ".selectPlace", svo);
	}

}
