package com.fly.member.join.dao;

import com.fly.member.join.vo.MemberVO;

public interface MemberDao {
	public int memberDelete(String userId);

	public int memberActive(String userId);

	public int memberJoin(MemberVO mvo);

	public MemberVO memberSelect(String m_id);

	public String securitySelect(String m_id);

	public int memberUpdate(MemberVO mvo);

	public int memberUpdatePN(MemberVO mvo);

	public int GetKey(MemberVO mvo);

	public int alter_userKey(MemberVO mvo);

	public MemberVO memberidserchC(MemberVO mvo);

	public MemberVO memberidserchU(MemberVO mvo);

	public int pwUpdate(MemberVO mvo);

}
