package com.fly.member.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fly.common.util.BCrypt;
import com.fly.common.util.SHA256;
import com.fly.member.join.service.MemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.login.service.LoginService;
import com.fly.member.login.vo.LoginVO;

/*리턴값 변경하기!!*/

@Controller
@RequestMapping("/member")
public class LoginController {

	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "memberService")
	private MemberService memberService;

	// 로그인 화면 보여주기 위한 메서드
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		log.info("login.do get 호출 성공");
		return "member/login";
	}

	// 로그인 처리 메서드
	// 참고 : 로그인 실패시 처리 내용 포함
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) throws Exception {
		log.info("login.do post 호출 성공");
		ModelAndView mav = new ModelAndView();
		String m_id = lvo.getM_id();
		String m_pw = lvo.getM_pw();
		int m_type = lvo.getM_type();

		int resultData = 0;
		resultData = loginService.loginHistoryInsert(lvo);

		if (resultData == 1) {
			mav.addObject("errCode", 1);
			mav.setViewName("member/login");
			return mav;
		}
		LoginVO lvoHistory = null;
		try {
			lvoHistory = loginService.loginHistorySelect(m_id);
		} catch (Exception e) {
			// TODO: handle exception
			mav.addObject("errCode", 1);
			mav.setViewName("member/login");
			return mav;
		}
		
		log.info("최근 로그인 일시:" + new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(lvoHistory.getLastFail()));
		log.info("retry:" + lvoHistory.getRetry());
		// 로그인 시도횟수가 5회가 넘으면 30초간 로그인 잠금
		if (lvoHistory.getRetry() >= 5) {

			if (new Date().getTime() - lvoHistory.getLastFail() < 30000) {
				mav.addObject("errCode", 6); // 30초당 로그인 잠금 알림
				mav.setViewName("member/login");
				return mav;
			}
		}
		MemberVO DBmvo = memberService.memberSelect(m_id);
		// SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다
		SHA256 sha = SHA256.getInsatnce();

		// SHA256클래스의 getSHA256()메소드를 사용해
		// 원래의 비밀번호를 SHA-256방식으로 암호화
		String shaPass = sha.getSha256(m_pw.getBytes());
		// 로그인이 틀리면 , 로그인 시도횟수를 1증가 시키고,
		// 로그인 실패 시간을 DB에 업데이트 한다.
		if (!BCrypt.checkpw(shaPass, DBmvo.getM_pw())) {
			System.out.println("비밀번호 불일치");
			lvoHistory.setRetry(lvoHistory.getRetry() + 1);
			lvoHistory.setLastFail(new Date().getTime());
			loginService.loginHistoryUpdate(lvoHistory);

			mav.addObject("retry", lvoHistory.getRetry());
			mav.addObject("errCode", 1);
			mav.setViewName("member/login");
			return mav;
		}
		// 로그인이 성공하면 , 로그인 시도 횟수 0으로 초기화
		// 마지막으로 로그인 실패 시간 0으로 reset,
		// 성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트
		else {
			System.out.println("비밀번호 일치");
			if (DBmvo.getM_type() == m_type) {
				System.out.println("타입 일치");
				if (DBmvo.getEmail_confirm().equals("Y")) {
					System.out.println("이메일 인증된 아이디");
					if (DBmvo.getM_status() == 0) {
						System.out.println("비활성화 로그인");
						mav.addObject("errCode", 4);
						mav.setViewName("member/login");
						return mav;
					} else {
						System.out.println("로그인 성공");
						lvoHistory.setRetry(0);
						lvoHistory.setLastPass(new Date().getTime());
						lvoHistory.setClientIp(request.getRemoteAddr());
						loginService.loginHistoryUpdate(lvoHistory);
						String Session_id = DBmvo.getM_id();
						int Session_type = DBmvo.getM_type();
						System.out.println(Session_id);
						System.out.println(Session_type);
						session.setAttribute("mvo", new MemberVO(Session_id, Session_type));
						mav.setViewName("/index");
						return mav;
					}
				} else {
					mav.addObject("errCode", 9);
					mav.setViewName("member/login");
					return mav;
				}
			} else {
				mav.addObject("errCode", 3);
				mav.setViewName("member/login");
				return mav;
			}

		}
	}

	// 비활성화 회원 활성화
	@RequestMapping(value = "/active.do", method = RequestMethod.GET)
	public ModelAndView memberActive(@ModelAttribute("LoginVO") LoginVO lvo, HttpSession session,
			HttpServletRequest request) throws Exception {
		log.info("active.do post 호출 성공");
		ModelAndView mav = new ModelAndView();
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		System.out.println(m_id);
		LoginVO lvoHistory = loginService.loginHistorySelect(m_id);
		System.out.println(new Date().getTime());
		System.out.println(lvoHistory.getLastPass());
		if (new Date().getTime() - lvoHistory.getLastPass() > 30000*87) {
			mav.addObject("errCode", 5); 
			mav.setViewName("member/login");
			return mav;
		}else {
			lvoHistory.setRetry(0);
			lvoHistory.setLastPass(new Date().getTime());
			lvoHistory.setClientIp(request.getRemoteAddr());
			loginService.loginHistoryUpdate(lvoHistory);
			memberService.memberActive(m_id);
			mav.setViewName("/index");
			return mav;
		}
		
	}

	// 로그아웃 처리 메서드
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "/index";
	}
}
