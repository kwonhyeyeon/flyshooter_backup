package com.fly.admin.terms.service;

import java.util.List;

import com.fly.admin.terms.vo.TermsVO;

public interface AdminTermsService {

	// 내용 수정
	public void updateTerms(TermsVO tvo);
	
	// 내용 출력
	public List<TermsVO> getTerms(int ctype);
	
}
