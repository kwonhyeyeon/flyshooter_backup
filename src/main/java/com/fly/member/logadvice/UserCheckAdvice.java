package com.fly.member.logadvice;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.fly.member.join.vo.MemberVO;

public class UserCheckAdvice {

	
	public Object userSessionCheck(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("user session chk");
		HttpServletRequest request = null;
		Model model = null;
		
		RedirectAttributes redirectAttr = null;
		
		String message = "";
		
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
				
				int type = mvo.getM_type();
				if( type == 2 ) {
					message = "일반 회원만 이용할수 있습니다.";
					request.setAttribute("message", message);
					return "index";
				}
				
							
			}catch(NullPointerException e) {
				message = "로그인후 이용할수 있습니다.";
				
				request.setAttribute("message", message);
				return "member/login";
			}
		}
		Object returnObj = pjp.proceed();
		
		
		return returnObj;
	}

	
}
