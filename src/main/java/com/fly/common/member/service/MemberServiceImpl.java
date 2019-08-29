package com.fly.common.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.common.member.dao.MemberDAO;
import com.fly.common.member.vo.MemberVO;
import com.fly.common.util.OpenCrypt;
import com.fly.common.util.Util;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	@Override
	public int memberJoin(MemberVO mvo) {
		if (memberDao.memberSelect(mvo.getM_id()) != null) {
			return 1;
		} else {
			try {
				mvo.setM_pw(new String(OpenCrypt.getSHA256(mvo.getM_pw(), Util.getRandomString())));
				memberDao.memberJoin(mvo);
				return 3;
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}
	}
	
	@Override
	public int userIdConfirm(String userId) {
		int result;
		if (memberDao.memberSelect(userId) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}
	
	@Override
	public MemberVO memberSelect(String m_Id) {
		MemberVO vo = memberDao.memberSelect(m_Id);
		return vo;
	}

	@Override
	public boolean memberUpdate(MemberVO mvo) {
		try {
			if (!mvo.getM_pw().isEmpty()) {
				String sec = memberDao.securitySelect(mvo.getM_id());
				mvo.setM_pw(new String(OpenCrypt.getSHA256(mvo.getM_pw(), sec)));
			}
			memberDao.memberUpdate(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public int memberDelete(String userId) {
		int isSucessCode = 3;
		try {
			isSucessCode = memberDao.memberDelete(userId);
			isSucessCode = 2;
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 3;
		}
		return isSucessCode;

	}

	

}
