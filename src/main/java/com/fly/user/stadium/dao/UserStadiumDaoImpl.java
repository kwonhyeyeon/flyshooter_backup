package com.fly.user.stadium.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.stadium.vo.StadiumVO;

@Repository("userStadiumDao")
public class UserStadiumDaoImpl implements UserStadiumDao {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAME_SPACE = "com.fly.user.stadium.dao.UserStadiumDao";
	
	@Override
	public List<StadiumVO> selectStadiumList(String p_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME_SPACE + ".stadiumList", p_num);
	}

	@Override
	public StadiumVO getSelectedStadiumInfo(int s_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAME_SPACE + ".selectStadiumInfo", s_no);
	}

}
