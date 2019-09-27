package com.fly.admin.terms.dao;

import java.util.List;

import com.fly.admin.terms.vo.TermsVO;

public interface AdminTermsDao {

	// 내용 수정
	public void updateTerms(TermsVO tvo);
	
	// 내용 출력
	public List<TermsVO> getTerms(int ctype);
	
}
