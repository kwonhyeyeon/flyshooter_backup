package com.fly.member.join.service;

import com.fly.member.join.vo.MemberVO;

public interface MemberService {
	public int memberJoin(MemberVO mvo);

	public MemberVO memberSelect(String userId);

	public boolean memberUpdate(MemberVO mvo);

	public int memberDelete(String userId);
	
	public int userIdConfirm(String userId);

}
