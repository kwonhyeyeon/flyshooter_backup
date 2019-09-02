package com.fly.user.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.place.vo.PlaceVO;

@Repository
public class PlaceDaoImpl implements PlaceDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "com.fly.user.place.dao.PlaceDao";
	
	@Override
	public List<PlaceVO> searchPlaceList(String area) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".searchPlaceList", area);
	}

}
