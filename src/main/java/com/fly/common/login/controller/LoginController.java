package com.fly.common.login.controller;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fly.common.login.service.LoginService;
import com.fly.common.login.vo.LoginVO;

/*리턴값 변경하기!!*/

//@Controller
//@RequestMapping("/member")
public class LoginController {

	private Logger log = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;
	//로그인 화면 보여주기 위한 메서드
		@RequestMapping(value="/login.do", method= RequestMethod.GET)
		public String login() {
			log.info("login.do get 호출 성공");
			return "member/login";
		}
		//로그인 처리 메서드
		//참고 : 로그인 실패시 처리 내용 포함
		@RequestMapping(value="/login.do", method = RequestMethod.POST)
		public ModelAndView loginProc(@ModelAttribute("LoginVO")LoginVO lvo,
				HttpSession session, HttpServletRequest request) {
				log.info("login.do post 호출 성공");
				ModelAndView mav = new ModelAndView();
				String m_id = lvo.getM_id();
				
				int resultData = 0;
				try {
				resultData = loginService.loginHistoryInsert(lvo);
				
				if(resultData==1) {
					mav.addObject("errCode",1);
					mav.setViewName("member/login");
					return mav;	
				}
				}catch(SQLException e){
					LoginVO vo = loginService.loginHistorySelect(m_id);
					log.info("최근 로그인 일시:"+ new SimpleDateFormat("YYYY-MM-dd")
					.format(vo.getLastFail()));
					log.info("retry:" + vo.getRetry());
				//로그인 시도횟수가 5회가 넘으면 30초간 로그인 잠금
					if(vo.getRetry()>=5) {
						if(new Date().getTime() - vo.getLastFail() < 30000) {
							mav.addObject("errCode", 6); //30초당 로그인 잠금 알림
							mav.setViewName("member/login");
							return mav;
						}else {
							vo.setRetry(0);
							vo.setLastFail(0);
							loginService.loginHistoryUpdate(vo);
						}
					}
					
					LoginVO loginCheckResult = loginService.loginSelect(lvo.getM_id(), lvo.getM_pw());
					
					//로그인이 틀리면 , 로그인 시도횟수를 1증가 시키고,
					//로그인 실패 시간을 DB에 업데이트 한다.
					if(loginCheckResult == null) {
						vo.setRetry(vo.getRetry()+1);
						vo.setLastFail(new Date().getTime());
						loginService.loginHistoryUpdate(vo);
						
						mav.addObject("retry", vo.getRetry());
						mav.addObject("errCode", 1);
						mav.setViewName("member/login");
						return mav;
					}
					//로그인이 성공하면 , 로그인 시도 횟수 0으로 초기화
					//마지막으로 로그인 실패 시간 0으로 reset,
					//성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트
					else {
						vo.setRetry(0);
						vo.setLastFail(0);
						vo.setLastPass(new Date().getTime());
						vo.setClientIp(request.getRemoteAddr());
						loginService.loginHistoryUpdate(vo);
						
						session.setAttribute("login", loginCheckResult);
						mav.setViewName("member/login");
						return mav;
					}
				}
				
				mav.setViewName("member/login");
				return mav;
		}
		//로그아웃 처리 메서드
		@RequestMapping("/logout.do")
		public String logout(HttpSession session, HttpServletRequest request) {
			session.invalidate();
			session = request.getSession(true);
			return "redirect:/member/login.do";
		}
}
