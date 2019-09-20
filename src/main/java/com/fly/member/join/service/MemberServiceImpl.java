package com.fly.member.join.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.common.util.BCrypt;
import com.fly.common.util.SHA256;
import com.fly.member.join.dao.MemberDao;
import com.fly.member.join.vo.MemberVO;

@Service("memberService")
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("memberDao")
	private MemberDao memberDao;

	@Override
	public int memberJoin(MemberVO mvo) {

		// SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다
		SHA256 sha = SHA256.getInsatnce();

		if (memberDao.memberSelect(mvo.getM_id()) != null) {
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
				memberDao.memberJoin(mvo);
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
		if (memberDao.memberSelect(userId) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public MemberVO memberSelect(String m_id) {
		MemberVO vo = memberDao.memberSelect(m_id);
		return vo;
	}

	@Override
	public int memberUpdate(MemberVO mvo) {

		// SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다
		SHA256 sha = SHA256.getInsatnce();
		if (mvo.getM_pw().equals("")) {
			memberDao.memberUpdatePN(mvo);
			return 3;
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
				memberDao.memberUpdate(mvo);
				return 3;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 2;
			}
		}
	}

	@Override
	public int memberActive(String userId) {
		int isSucessCode = 3;
		try {
			isSucessCode = memberDao.memberActive(userId);
			isSucessCode = 2;
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 3;
		}
		return isSucessCode;

	}
	
	@Override
	public int memberDelete(String userId) {
		int isSucessCode = 2;
		try {
			isSucessCode = memberDao.memberDelete(userId);
			isSucessCode = 3;
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 1;
		}
		return isSucessCode;

	}

	@Override
	public List<MemberVO> memberidserch(MemberVO mvo) {
		// TODO Auto-generated method stub
		List<MemberVO> idserch = null;
		if (mvo.getM_type() == 1) {
			idserch = memberDao.memberidserchU(mvo);
		} else {
			idserch = memberDao.memberidserchC(mvo);
		}

		return idserch;
	}

	@Override
	public int pwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
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
			memberDao.pwUpdate(mvo);
			return 3;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 2;
		}
	}

}
