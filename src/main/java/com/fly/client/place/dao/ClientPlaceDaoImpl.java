package com.fly.client.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
