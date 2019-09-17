package com.fly.user.rental.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.rental.vo.RentalVO;
@Repository("userRentalDao")
public class UserRentalDaoImpl implements UserRentalDao {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.user.rental.dao.UserRentalDao";
	
	@Override
	public List<String> searchReservationTime(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".searchReservationTime", map);
	}

	@Override
	public int reservationCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAME_SPACE + ".reservationCheck", map);
	}

	@Override
	public int deleteReservation(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAME_SPACE + ".deleteReservation", map);
	}

	@Override
	public int insertRental(RentalVO rvo) {
		// TODO Auto-generated method stub
		
		System.out.println(rvo.toString());
		return (int)sqlSession.insert(NAME_SPACE + ".insertRental", rvo);
	}


}


