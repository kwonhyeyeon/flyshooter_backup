package com.fly.admin.rentalstatus.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;

@Repository("AdminRentalStatusDao")
public class AdminRentalStatusDaoImpl implements AdminRentalStatusDao {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.admin.rentalstatus.dao.AdminRentalStatusDao";
	
	@Override
	public List<AdminRentalStatusVO> selectRental(AdminRentalStatusVO rvo) {
		return sqlSession.selectList(NAME_SPACE + ".selectRental", rvo);
	}

}
