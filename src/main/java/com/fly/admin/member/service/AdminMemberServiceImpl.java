package com.fly.admin.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fly.admin.member.dao.AdminMemberDao;
import com.fly.member.join.vo.MemberVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	@Qualifier("adminMemberDao")
	private AdminMemberDao adminMemberDao;

	@Override
	public List<MemberVO> getMemberList(MemberVO mvo) {
		// TODO Auto-generated method stub
		
		return adminMemberDao.getMemberList(mvo);
	}
	@Override
	public int getTotalSize(MemberVO mvo) {
		// TODO Auto-generated method stub
		
		return adminMemberDao.getTotalSize(mvo);
	}

	@Override
	public int searchUserReservedCnt(MemberVO mvo) {
		// TODO Auto-generated method stub
		return adminMemberDao.searchUserReservedCnt(mvo);
	}

	@Override
	public void updateMember(MemberVO mvo) {
		adminMemberDao.updateMember(mvo);
		
	}

	@Override
	public int searchClientPlaceCnt(MemberVO mvo) {
		// TODO Auto-generated method stub
		return adminMemberDao.searchClientPlaceCnt(mvo);
	}

	
	
	
}
