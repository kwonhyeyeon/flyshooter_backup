package com.fly.admin.place.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;

public interface AdminPlaceService {

	// 구장 리스트 출력
	public List<PlaceVO> adminPlaceList(PlaceVO pvo);
	
	// 구장 상세 정보 출력
	public PlaceVO adminPlaceDetail(String num);
	
	// 폐업으로 변경된 날짜 출력
	public void getCloseDate(String p_num);
	
	// 구장 승인 상태 변경
	public void updatePok(PlaceVO pvo);
	
	// 리스트 사이즈(paging)
	public int adminPlaceListCnt(PlaceVO pvo);
	
	// 구장 폐업 등록
	public void updateClose(PlaceVO pvo);
	
	// 폐업 등록 시 대관 리스트 확인
	public int getRentalCnt(String p_num);
	
	// 사업자가 요청한 환불 리스트 출력
	public List<Map<String, Object>> getRefundList(RentalVO rvo);
	
	// 환불 리스트 사이즈
	public int clientRefundCnt(RentalVO rvo);
	
	// 환불 상세 페이지
	public HashMap<String, Object> refundDetail(int r_no);
	
	// 환불 상태 변경
	public void updateRefund(int r_no);
	
	// 환불 지급일 출력
	public void getRefundDay(int r_no);
	
}
