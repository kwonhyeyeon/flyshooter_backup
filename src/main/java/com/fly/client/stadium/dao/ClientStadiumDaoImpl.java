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
	public List<StadiumVO> stadiumList(String p_num) {
		// TODO Auto-generated method stub
		return session.selectList("stadiumList", p_num);
	}
	
	@Override
	public StadiumVO stadiumDetail(String s_no) {
		// TODO Auto-generated method stub
		return session.selectOne("stadiumDetail", s_no);
	}
	
	@Override
	public int stadiumInsert(StadiumVO svo) {
		// TODO Auto-generated method stub
		return session.insert("stadiumInsert", svo);
	}

	@Override
	public int stadiumModify(StadiumVO svo) {
		// TODO Auto-generated method stub
		return session.update("stadiumModify", svo);
	}

	@Override
	public int closeStadium(String s_no) {
		// TODO Auto-generated method stub
		return session.selectOne("closeStadium",s_no);
	}

	





}
