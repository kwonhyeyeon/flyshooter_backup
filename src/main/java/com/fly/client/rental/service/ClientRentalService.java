package com.fly.client.rental.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Map<String, String>> getRefundList(PlaceVO pvo);

	// 회원가입일
	public String getRegdate(String m_id);

	// paging
	public int refundListCnt();

	// 환불요청
	public int refundUpdate(int r_no);

	// 오프라인대관 대관취소
	public int deleteRental(int r_no);

	// 대관 상세 정보
	public HashMap<String, Object> getDetailRefund(int r_no);
	
	// 오프라인 대관등록
	public int offlineRentalInsert(RentalVO rvo);

}
