package com.fly.admin.terms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.admin.terms.dao.AdminTermsDao;
import com.fly.admin.terms.vo.TermsVO;

@Service("adminTermsService")
public class AdminTermsServiceImpl implements AdminTermsService {
	
	@Autowired
	@Qualifier("adminTermsDao")
	private AdminTermsDao adminTermsDao;

	@Override
	public void updateTerms(TermsVO tvo) {
		adminTermsDao.updateTerms(tvo);
	}

	@Override
	public List<TermsVO> getTerms(int ctype) {
		return adminTermsDao.getTerms(ctype);
	}
	
}
