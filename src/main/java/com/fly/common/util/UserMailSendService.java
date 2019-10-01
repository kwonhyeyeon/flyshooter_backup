package com.fly.common.util;

import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fly.common.util.MailUtils;
import com.fly.member.join.dao.MemberDao;
import com.fly.member.join.vo.MemberVO;

@Service("userMailSendService")
public class UserMailSendService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private MemberDao memberDao;

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	@Transactional
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(MemberVO mvo) throws Exception {

		mvo.setEmail_confirm(getKey(false, 20));
		memberDao = sqlSession.getMapper(MemberDao.class);
		System.out.println("난수 값 넣기");
		memberDao.getKey(mvo);
		System.out.println("이메일 보내기");

		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);
		
		System.out.println("이메일 보내기");
		sendMail.setSubject("[Fly Shooter] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer()
				.append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/member/join_success.do?")
				.append("&m_id=")
				.append(mvo.getM_id())
				.append("&email_confirm=")
				.append(mvo.getEmail_confirm())
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("FlyShooter ", "admin");
		sendMail.setTo(mvo.getM_id());
		sendMail.send();
	}
	
	public void pwModify(MemberVO mvo) throws Exception {

		System.out.println("pw 수정 이메일 보내기");

		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);
		
		System.out.println("이메일 보내기");
		sendMail.setSubject("[Fly Shooter] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer()
				.append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8080/member/pwmodify.do?")
				.append("&m_id=")
				.append(mvo.getM_id())
				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("FlyShooter ", "admin");
		sendMail.setTo(mvo.getM_id());
		sendMail.send();
	}

	// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	public int alter_userKey_service(MemberVO mvo) {

		int resultCnt = 0;

		memberDao = sqlSession.getMapper(MemberDao.class);
		resultCnt = memberDao.alterUserKey(mvo);

		return resultCnt;
	}
}