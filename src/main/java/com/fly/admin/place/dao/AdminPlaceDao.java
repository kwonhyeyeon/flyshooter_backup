package com.fly.admin.place.dao;

import java.util.HashMap;
import java.util.List;

import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;

public interface AdminPlaceDao {

	// 구장 리스트
	public List<PlaceVO> adminPlaceList(PlaceVO pvo);
	
	// 구장 상세 정보
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
	public List<RentalVO> getRefundList();
	
}
