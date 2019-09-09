package com.fly.client.place.dao;

import java.util.List;

import com.fly.client.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;

public interface ClientPlaceDao {

   // 구장별 경기장 리스트
   public List<StadiumVO> stadiumList(String p_name);

   // 구장 리스트
   public List<PlaceVO> placeList();

   // 구장 상세페이지
   public PlaceVO placeDetail(String p_num);

   // 구장 등록
   public int placeInsert(PlaceVO pvo);

}