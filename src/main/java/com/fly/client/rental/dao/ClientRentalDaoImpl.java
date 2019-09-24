package com.fly.client.rental.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		public List<Map<String, String>> getRefundList(PlaceVO pvo) {
			return sqlSession.selectList(NAME_SPACE + ".getRefundList", pvo);
		}

		@Override
		public int refundListCnt() {
			return sqlSession.selectOne(NAME_SPACE + ".refundListCnt");
		}

		@Override
		public int refundUpdate(int r_no) {
			// TODO Auto-generated method stub
			return sqlSession.update(NAME_SPACE + ".refund_request", r_no);
		}

		@Override
		public int deleteRental(int r_no) {
			// TODO Auto-generated method stub
			return sqlSession.delete(NAME_SPACE + ".deleteRental", r_no);
		}


	
}
