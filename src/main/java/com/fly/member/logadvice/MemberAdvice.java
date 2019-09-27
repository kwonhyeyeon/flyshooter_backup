package com.fly.member.logadvice;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.fly.member.join.vo.MemberVO;

public class MemberAdvice {

	// 회원의 로그인상태를 확인함
	public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("login session chk");
		HttpServletRequest request = null;
		Model model = null;
		ModelAndView mav = null;
		
		RedirectAttributes redirectAttr = null;
		
		String log_message = "";
		
		for(Object obj : pjp.getArgs()) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}else if(obj instanceof Model) {
				model = (Model) obj;
			}
		}
		
		if(request != null) {
			HttpSession session = request.getSession();
			
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			
			try {
				
				System.out.println("m_id ::::::::::::" + mvo.getM_id());
				System.out.println("m_type ::::::::::::" + mvo.getM_type());
				
							
			}catch(NullPointerException e) {
				log_message = "로그인후 이용할수 있습니다.";
				request.setAttribute("log_message", log_message);
				try {
					return "member/login";
				}catch(Exception ex){
					mav.setViewName("member/login");
				}
			}
		}
		Object returnObj = pjp.proceed();
		
		if(returnObj instanceof ModelAndView ) {
			 mav = (ModelAndView) returnObj;
			 return mav;
		}
		
		
		return returnObj;
	}

	// 로그인 정보가 일반회원인지 검사
	public Object userCheck(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("user type chk");
		HttpServletRequest request = null;
		Model model = null;
		ModelAndView mav = null;
		
		RedirectAttributes redirectAttr = null;
		
		String log_message = "";
		
		for(Object obj : pjp.getArgs()) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}else if(obj instanceof Model) {
				model = (Model) obj;
			}
		}
		
		if(request != null) {
			HttpSession session = request.getSession();
			
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			
			try {
				
				System.out.println("m_id ::::::::::::" + mvo.getM_id());
				System.out.println("m_type ::::::::::::" + mvo.getM_type());
				
				int m_type = mvo.getM_type();
				if( m_type == 2 ) {
					// 사업자일경우 다른페이지로 리턴처리
					log_message = "사업자회원은 이용하실수 없습니다.";
					
					request.setAttribute("log_message", log_message);
					try {
						return "index";
					}catch(Exception ex){
						mav.setViewName("index");
					}
					
				}
							
			}catch(NullPointerException e) {
				log_message = "로그인후 이용할수 있습니다.";
				
				request.setAttribute("log_message", log_message);
				try {
					return "member/login";
				}catch(Exception ex){
					mav.setViewName("member/login");
				}
			}
		}
		Object returnObj = pjp.proceed();
		
		
		if(returnObj instanceof ModelAndView ) {
			 mav = (ModelAndView) returnObj;
			 return mav;
		}
		
		return returnObj;
	}
	
	
	// 로그인 정보가 일반회원인지 검사
		public Object clientCheck(ProceedingJoinPoint pjp) throws Throwable {
			System.out.println("client type chk");
			HttpServletRequest request = null;
			Model model = null;
			ModelAndView mav = null;
			
			RedirectAttributes redirectAttr = null;
			
			String log_message = "";
			
			for(Object obj : pjp.getArgs()) {
				if(obj instanceof HttpServletRequest) {
					request = (HttpServletRequest) obj;
				}else if(obj instanceof Model) {
					model = (Model) obj;
				}
			}
			
			if(request != null) {
				HttpSession session = request.getSession();
				
				MemberVO mvo = (MemberVO) session.getAttribute("mvo");
				
				try {
					
					System.out.println("m_id ::::::::::::" + mvo.getM_id());
					System.out.println("m_type ::::::::::::" + mvo.getM_type());
					
								
					int m_type = mvo.getM_type();
					if( m_type == 1 ) {
						// 일반회원일경우 다른페이지로 리턴처리
						log_message = "일반회원은 이용하실수 없습니다.";
						
						request.setAttribute("log_message", log_message);
						try {
							return "index";
						}catch(Exception ex){
							mav.setViewName("index");
						}
						
					}
				}catch(NullPointerException e) {
					log_message = "로그인후 이용할수 있습니다.";
					
					request.setAttribute("log_message", log_message);
					try {
						return "member/login";
					}catch(Exception ex){
						mav.setViewName("member/login");
					}
				}
			}
			Object returnObj = pjp.proceed();
			
			if(returnObj instanceof ModelAndView ) {
				 mav = (ModelAndView) returnObj;
				 return mav;
			}
			
			return returnObj;
		}
}
