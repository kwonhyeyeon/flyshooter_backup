package com.fly.client.rental.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

@Repository("clientRentalDao")
public class ClientRentalDaoImpl implements ClientRentalDao {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.client.rental.dao.clientRentalDao";
	
		// 구장 리스트
		@Override
		public List<PlaceVO> getPlaceList(String m_id) {
			return sqlSession.selectList(NAME_SPACE + ".placeList", m_id);
		}
		
		// 경기장 리스트
		@Override
		public List<StadiumVO> getStadiumList(String p_num) {
			return sqlSession.selectList(NAME_SPACE + ".stadiumList", p_num);
		}
		
		// 대관 예약 리스트
		@Override
		public List<RentalVO> getRentalList(HashMap<String, Object> map) {
			return sqlSession.selectList(NAME_SPACE + ".rentalList", map);
		}

		@Override
		public List<RentalVO> getRefundList(MemberVO mvo) {
			return sqlSession.selectList(NAME_SPACE + ".getRefundList", mvo);
		}

		@Override
		public int refundListCnt() {
			return sqlSession.selectOne(NAME_SPACE + ".refundListCnt");
		}


	
}
