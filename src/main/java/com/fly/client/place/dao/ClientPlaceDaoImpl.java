package com.fly.client.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;

@Repository("clientPlaceDao")
public class ClientPlaceDaoImpl implements ClientPlaceDao {
   
   @Autowired
   private SqlSession sqlSession;
   
   // 구장별 경기장 리스트
   @Override
   public List<StadiumVO> stadiumList(String p_name) {
      return sqlSession.selectList("stadiumList", p_name);
   }
   //구장리스트 목록 출력
   @Override
   public List<PlaceVO> placeList() {
      return sqlSession.selectList("placeList");
   }
   //구장 등록
   @Override
   public int placeInsert(PlaceVO pvo) {
      return sqlSession.insert("placeInsert", pvo);
   }
   //구장 상세보기
   @Override
   public PlaceVO placeDetail(String p_num) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("placeDetail", p_num);
   }

}