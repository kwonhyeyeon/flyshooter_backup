package com.fly.common.member.dao;

import com.fly.common.member.vo.MemberVO;

public interface MemberDAO {
	public int memberDelete(String userId);

	public int memberJoin(MemberVO mvo);

	public MemberVO memberSelect(String m_id);

	public String securitySelect(String m_id);

	public int memberUpdate(MemberVO mvo);

	public void GetKey(String user_id, String key);

	public int alter_userKey(String user_id, String key);

}
