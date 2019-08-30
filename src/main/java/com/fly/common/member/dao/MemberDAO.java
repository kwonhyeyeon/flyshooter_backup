package com.fly.common.member.dao;

import com.fly.common.member.vo.MemberVO;

public interface MemberDAO {
	public int userIdConfirm(String userId);

	public int memberDelete(String userId);

	public int memberJoin(MemberVO mvo);

	public MemberVO memberSelect(String m_id);

	public String securitySelect(String m_id);

	public void memberUpdate(MemberVO mvo);

}
