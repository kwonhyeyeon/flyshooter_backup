package com.fly.client.place.dao;

import java.util.List;

import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

public interface ClientPlaceDao {

	// 구장별 경기장 리스트
	public List<StadiumVO> stadiumList(String p_name);

	// 구장 리스트
	public List<PlaceVO> placeList(PlaceVO pvo);

	// 구장 상세페이지
	public PlaceVO placeDetail(String p_num);

	// 구장 등록
	public int placeInsert(PlaceVO pvo);

	// 구장 수정
	public int placeModify(PlaceVO pvo);

	public int closePlace(String p_num);

	public List<PlaceVO> placeChoice(String m_id);

}