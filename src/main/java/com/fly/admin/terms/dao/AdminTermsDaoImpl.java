package com.fly.admin.terms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fly.admin.terms.vo.TermsVO;

@Repository("adminTermsDao")
public class AdminTermsDaoImpl implements AdminTermsDao {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAME_SPACE = "com.fly.admin.terms.dao.AdminTermsDao";

	@Override
	public void updateTerms(TermsVO tvo) {
		sqlSession.insert(NAME_SPACE + ".updateTerms", tvo);
	}

	@Override
	public List<TermsVO> getTerms(int ctype) {
		return sqlSession.selectList(NAME_SPACE + ".getTerms", ctype);
	}
	
}
