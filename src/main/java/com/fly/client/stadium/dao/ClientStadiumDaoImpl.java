package com.fly.client.stadium.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.stadium.vo.StadiumVO;

@Repository
public class ClientStadiumDaoImpl implements ClientStadiumDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<StadiumVO> stadiumList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StadiumVO stadiumDetail(String s_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int stadiumInsert(StadiumVO svo) {
		// TODO Auto-generated method stub
		return session.insert("stadiumInsert", svo);
	}

	@Override
	public int stadiumModify(StadiumVO svo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
