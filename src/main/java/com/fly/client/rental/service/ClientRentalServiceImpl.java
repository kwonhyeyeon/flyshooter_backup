package com.fly.client.rental.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.client.rental.dao.ClientRentalDao;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

@Service("clientRentalService")
public class ClientRentalServiceImpl implements ClientRentalService {

	@Autowired
	@Qualifier("clientRentalDao")
	private ClientRentalDao clientRentalDao;
	
	
		@Override
		public List<PlaceVO> getPlaceList(String m_id) {
			
			return clientRentalDao.getPlaceList(m_id);
		}
		
		@Override
		public List<StadiumVO> getStadiumList(String p_num) {
			
			return clientRentalDao.getStadiumList(p_num);
		}
		
		// 대관 예약 리스트
		@Override
		public List<RentalVO> getRentalList(int s_no, String selectDay) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("s_no", s_no);
			map.put("selectDay", selectDay);
			
			return clientRentalDao.getRentalList(map);
		}

		@Override
		public List<RentalVO> getRefundList(MemberVO mvo) {
			return clientRentalDao.getRefundList(mvo);
		}

		@Override
		public int refundListCnt() {
			return clientRentalDao.refundListCnt();
		}

}
