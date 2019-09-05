package com.fly.member.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.common.util.BCrypt;
import com.fly.common.util.OpenCrypt;
import com.fly.common.util.SHA256;
import com.fly.common.util.Util;
import com.fly.member.join.dao.MemberDAO;
import com.fly.member.join.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int memberJoin(MemberVO mvo) {

		// SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다
		SHA256 sha = SHA256.getInsatnce();

		if (memberDAO.memberSelect(mvo.getM_id()) != null) {
			return 1;
		} else {
			String orgPass = mvo.getM_pw();

			// SHA256클래스의 getSHA256()메소드를 사용해
			// 원래의 비밀번호를 SHA-256방식으로 암호화
			String shaPass = null;
			try {
				shaPass = sha.getSha256(orgPass.getBytes());

				// SHA-256방식으로 암호화된 값을 다시 BCrypt클래스의
				// hashpw()메소드를 사용해서 ncrypt방식으로 암호화
				// BCrypt.gnesalt()메소드는 salt값을 난수를 사용해 생성.
				String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt(10));

				mvo.setM_pw(bcPass);
				memberDAO.memberJoin(mvo);
				return 3;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 2;
			}
		}
	}

	@Override
	public int userIdConfirm(String userId) {
		int result;
		if (memberDAO.memberSelect(userId) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public MemberVO memberSelect(String m_Id) {
		MemberVO vo = memberDAO.memberSelect(m_Id);
		return vo;
	}

	@Override
	public int memberUpdate(MemberVO mvo) {

		// SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다
		SHA256 sha = SHA256.getInsatnce();

		String orgPass = mvo.getM_pw();

		// SHA256클래스의 getSHA256()메소드를 사용해
		// 원래의 비밀번호를 SHA-256방식으로 암호화
		String shaPass = null;
		try {
			shaPass = sha.getSha256(orgPass.getBytes());

			// SHA-256방식으로 암호화된 값을 다시 BCrypt클래스의
			// hashpw()메소드를 사용해서 ncrypt방식으로 암호화
			// BCrypt.gnesalt()메소드는 salt값을 난수를 사용해 생성.
			String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt(10));

			mvo.setM_pw(bcPass);
			memberDAO.memberUpdate(mvo);
			return 3;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 2;
		}
	}

	@Override
	public int memberDelete(String userId) {
		int isSucessCode = 3;
		try {
			isSucessCode = memberDAO.memberDelete(userId);
			isSucessCode = 2;
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 3;
		}
		return isSucessCode;

	}

}
