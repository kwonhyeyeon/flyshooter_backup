package com.fly.admin.member.dao;

import java.util.HashMap;
import java.util.List;

import com.fly.member.join.vo.MemberVO;

public interface AdminMemberDao {

	// 회원 정보 list
	public List<MemberVO> getMemberList(MemberVO mvo);
	
	// List의 총 갯수
	public int getTotalSize(MemberVO mvo);
	
	// 일반회원 상태변경시 등록된 대관수 select
	public int searchUserReservedCnt(MemberVO mvo);
	
	// 사업자 상태변경시 등록된 구장수 select
	public int searchClientPlaceCnt(MemberVO mvo);
	
	// 회원 상태 변경
	public void updateMember(MemberVO mvo);
}
