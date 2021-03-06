package com.fly.member.join.dao;

import java.util.List;

import com.fly.member.join.vo.MemberVO;

public interface MemberDao {
	public int memberDelete(String userId);

	public int memberActive(String userId);

	public int memberJoin(MemberVO mvo);

	public MemberVO memberSelect(String m_id);

	public String securitySelect(String m_id);

	public int memberUpdate(MemberVO mvo);

	public int memberUpdatePN(MemberVO mvo);

	public int getKey(MemberVO mvo);

	public int alterUserKey(MemberVO mvo);

	public List<MemberVO> memberidsearchC(MemberVO mvo);

	public List<MemberVO> memberidsearchU(MemberVO mvo);

	public int pwUpdate(MemberVO mvo);

}
