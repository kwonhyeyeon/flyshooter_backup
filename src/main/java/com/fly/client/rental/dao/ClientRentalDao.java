package com.fly.client.rental.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

public interface ClientRentalDao {

	// 구장 리스트
	public List<PlaceVO> getPlaceList(String m_id);

	// 경기장 리스트
	public List<StadiumVO> getStadiumList(String p_num);

	// 대관 예약 리스트
	public List<RentalVO> getRentalList(HashMap<String, Object> map);

	// 환불 리스트
	public List<Map<String, String>> getRefundList(PlaceVO pvo);

	// 회원가입일
	public String getRegdate(String m_id);

	// 환불 리스트 paging
	public int refundListCnt();

	// 환불요청
	public int refundUpdate(int r_no);

	// 오프라인대관 대관취소
	public int deleteRental(int r_no);

	// 대관 상세 정보
	public RentalVO getDetailRefund(int r_no);

}
