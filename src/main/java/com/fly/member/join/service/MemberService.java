package com.fly.member.join.service;

import com.fly.member.join.vo.MemberVO;

public interface MemberService {
	public int memberJoin(MemberVO mvo);

	public MemberVO memberSelect(String userId);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String userId);

	public int memberActive(String userId);

	public int userIdConfirm(String userId);

	public MemberVO memberidserch(MemberVO mvo);

	public int pwUpdate(MemberVO mvo);

}