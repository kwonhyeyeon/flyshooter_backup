package com.fly.client.rental.service;

import java.util.List;

import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

public interface ClientRentalService {
	
	// 구장 리스트
	public List<PlaceVO> getPlaceList(String m_id);

	// 경기장 리스트
	public List<StadiumVO> getStadiumList(String p_num);
	
	// 대관 예약 리스트
	public List<RentalVO> getRentalList(int s_no, String selectDay);
	
	// 환불 리스트
	public List<RentalVO> getRefundList(MemberVO mvo);
	
	// paging
	public int refundListCnt();
	
}
