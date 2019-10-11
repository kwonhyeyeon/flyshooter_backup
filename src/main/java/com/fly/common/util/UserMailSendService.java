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
		memberDao.getKey(mvo);

		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("[FLY SHOOTER] 회원가입 인증 메일입니다.");
		sendMail.setText(new StringBuffer()
				.append("<div style='width:600px;margin:0 auto;'>")
				.append("<h1 style='height:46px;text-align:right;margin:20px 0 50px;border-bottom:2px solid #2b2b2b;font-family:Malgun Gothic;'>FLY SHOOTER</h1>")
				.append("<div style='border-bottom:1px solid #2b2b2b;margin-bottom:20px;padding:10px;'>")
				.append("<h2 stlye='font-size:32px;letter-spacing:-2px;'><b>회원가입</b>을<br>축하드립니다</h2>")
				.append("<p style='line-height:22px;margin-top:30px;'><b>")
				.append(mvo.getM_name())
				.append("</b> 님의 <b>FLY SHOOTER</b> 회원가입을 축하드립니다!<br>")
				.append("본인 확인을 위하여 아래 링크를 클릭해 이메일 인증을 완료해 주세요.</p>")
				.append("<a style='display:inline-block;margin:50px auto;text-decoration:none;font-size:16px;'")
				.append(" href='http://192.168.0.37:8080/member/join_success.do?&m_id=")
				.append(mvo.getM_id())
				.append("&email_confirm=")
				.append(mvo.getEmail_confirm())
				.append("' target='_blank'>이메일 인증하기</a></div>")
				.append("<p style='font-size:14px;'>본 메일은 발신 전용으로 회신되지 않습니다.</p>")
				.append("<p style='margin-top:10px;font-size:12px;'>Copyright © FLYSHOOTER. All rights reserved.</p></div>").toString());
		sendMail.setFrom("FlyShooter", "admin");
		sendMail.setTo(mvo.getM_id());
		sendMail.send();
	}
	
	public void pwModify(MemberVO mvo) throws Exception {
		// mail 작성 관련
		MailUtils sendMail = new MailUtils(mailSender);
		//192.168.0.37:8080
		sendMail.setSubject("[Fly Shooter] 비밀번호 찾기 이메일 인증");
		sendMail.setText(new StringBuffer()
				.append("<div style='width:600px;margin:0 auto;'>")
				.append("<h1 style='height:46px;text-align:right;margin:20px 0 50px;border-bottom:2px solid #2b2b2b;font-family:Malgun Gothic;'>FLY SHOOTER</h1>")
				.append("<div style='border-bottom:1px solid #2b2b2b;margin-bottom:20px;padding:10px;'>")
				.append("<h2 stlye='font-size:32px;letter-spacing:-2px;'>이메일 인증</h2>")
				.append("<p style='line-height:22px;margin-top:30px;'>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a style='display:inline-block;margin:50px auto;text-decoration:none;font-size:16px;'")
				.append(" href='http://192.168.0.37:8080/member/pwmodify.do?&m_id=")
				.append(mvo.getM_id())
				.append("' target='_blank'>이메일 인증하기</a></div>")
				.append("<p style='font-size:14px;'>본 메일은 발신 전용으로 회신되지 않습니다.</p>")
				.append("<p style='margin-top:10px;font-size:12px;'>Copyright © FLYSHOOTER. All rights reserved.</p></div>").toString());
		sendMail.setFrom("FlyShooter ", "admin");
		sendMail.setTo(mvo.getM_id());
		sendMail.send();
	}

	// 인증 확인 메서드 (Y 값으로 바꿔주는 메서드)
	public int alterUserKeyService(MemberVO mvo) {

		int resultCnt = 0;

		memberDao = sqlSession.getMapper(MemberDao.class);
		resultCnt = memberDao.alterUserKey(mvo);

		return resultCnt;
	}
}