package com.fly.client.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;

@Repository("clientPlaceDao")
public class ClientPlaceDaoImpl implements ClientPlaceDao {

	@Autowired
	private SqlSession sqlSession;

	private String NAME_SPACE = "com.fly.client.place.dao.ClientPlaceDao";

	// 구장별 경기장 리스트
	@Override
	public List<StadiumVO> stadiumList(String p_name) {
		return sqlSession.selectList(NAME_SPACE + ".stadiumList", p_name);
	}

	// 구장리스트 목록 출력
	@Override
	public List<PlaceVO> placeList(PlaceVO pvo) {
		return sqlSession.selectList(NAME_SPACE + ".placeList", pvo);
	}

	// 구장 등록
	@Override
	public int placeInsert(PlaceVO pvo) {
		return sqlSession.insert(NAME_SPACE + ".placeInsert", pvo);
	}

	// 구장 상세보기
	@Override
	public PlaceVO placeDetail(String p_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".placeDetail", p_num);
	}

	@Override
	public int placeModify(PlaceVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAME_SPACE + ".placeModify", pvo);
	}

	@Override
	public int closePlace(String p_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".closePlace", p_num);
	}

	@Override
	public List<PlaceVO> placeChoice(String m_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".placeChoice", m_id);
	}

}