package com.fly.admin.stadium.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.member.stadium.vo.StadiumVO;

@Repository("adminStadiumDao")
public class AdminStadiumDaoImpl implements AdminStadiumDao {

	@Autowired
	private SqlSession sqlsession;
	
	private String NAME_SPACE = "com.fly.admin.stadium.dao.AdminStadiumDao";

	@Override
	public List<StadiumVO> getStadiumList(StadiumVO svo) {
		return sqlsession.selectList(NAME_SPACE + ".getStadiumList", svo);
	}

	@Override
	public StadiumVO getStadiumDetail(int s_no) {
		return sqlsession.selectOne(NAME_SPACE + ".getStadiumDetail", s_no);
	}

	@Override
	public void updateStdmAccept(int s_no) {
		sqlsession.update(NAME_SPACE + ".updateStdmAccept", s_no);
	}
	
}
