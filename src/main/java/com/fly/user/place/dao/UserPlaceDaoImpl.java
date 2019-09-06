package com.fly.user.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.client.place.vo.PlaceVO;

@Repository("placeDao")
public class UserPlaceDaoImpl implements UserPlaceDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "com.fly.user.place.dao.UserPlaceDao";
	
	// 지역으로 검색한 구장리스트
	@Override
	public List<PlaceVO> searchPlaceList(String area) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".searchPlaceList", area);
	}

	// 리스트에서 선택된 구장정보
	@Override
	public PlaceVO selectPlace(String p_num) {
		// TODO Auto-generated method stub
		return (PlaceVO)sqlSession.selectOne(NAME_SPACE + ".selectPlace", p_num);
	}

}
