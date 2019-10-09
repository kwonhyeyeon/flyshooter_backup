package com.fly.user.rental.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;
import com.fly.rental.detail.vo.RentalDetailVO;
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
		
		return (int)sqlSession.insert(NAME_SPACE + ".insertRental", rvo);
	}

	@Override
	public List<RentalVO> selectMyRentalList(RentalVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".selectMyRentalList", rvo);
	}

	@Override
	public int myRentalListCnt(String m_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".myRentalListCnt", m_id);
	}

	@Override
	public RentalDetailVO showDetail(int r_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".showRentalDetail", r_no);
	}

	@Override
	public int rentalUpdate(RentalVO rvo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAME_SPACE + ".rentalUpdate", rvo);
	}

	@Override
	public StadiumVO selectStadiumImg(int s_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".selectImg", s_no);
	}

	@Override
	public long selectReservationMinutes(String overlapKey) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".selectReservationMinutes", overlapKey);
	}

	@Override
	public int updateReservation_minutes(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAME_SPACE + ".updateReservationMinutes", map);
	}


}


