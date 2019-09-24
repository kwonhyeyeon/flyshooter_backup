package com.fly.admin.place.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.place.vo.PlaceVO;

@Repository("adminPlaceDao")
public class AdminPlaceDaoImpl implements AdminPlaceDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.admin.place.dao.AdminPlaceDao";

	@Override
	public List<PlaceVO> adminPlaceList(PlaceVO pvo) {
		return sqlSession.selectList(NAME_SPACE + ".adminPlaceList", pvo);
	}

	@Override
	public PlaceVO adminPlaceDetail(String num) {
		return (PlaceVO)sqlSession.selectOne(NAME_SPACE + ".adminPlaceDetail", num);
	}

	@Override
	public void getCloseDate(String p_num) {
		sqlSession.update(NAME_SPACE + ".getCloseDate", p_num);
	}

	@Override
	public void updatePok(PlaceVO pvo) {
		sqlSession.update(NAME_SPACE + ".updatePok", pvo);
	}

	@Override
	public int adminPlaceListCnt(PlaceVO pvo) {
		return sqlSession.selectOne(NAME_SPACE + ".adminPlaceListCnt", pvo);
	}

	@Override
	public void updateClose(PlaceVO pvo) {
		sqlSession.update(NAME_SPACE + ".updateClose", pvo);
	}

	@Override
	public int getRentalCnt(String p_num) {
		return sqlSession.selectOne(NAME_SPACE + ".getRentalCnt", p_num);
	}

}
