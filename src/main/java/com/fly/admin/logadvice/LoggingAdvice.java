package com.fly.admin.logadvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public class LoggingAdvice {

		public Object adminSessionChk(ProceedingJoinPoint pjp) throws Throwable {
			System.out.println("admin login chk");
			HttpServletRequest request = null;
			Model model = null;
			ModelAndView mav = new ModelAndView();
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
				
				String adminId = (String) session.getAttribute("adminId");
				
				try {
					adminId.length();
				}catch(NullPointerException e) {
					log_message = "로그인후 이용할수 있습니다.";
					request.setAttribute("log_message", log_message);
					
					if( pjp.getSignature().toString().contains("ModelAndView") ) {
						mav.setViewName("admin/login.do");
						return mav;
					}
					return "redirect:/admin/login.do";
					
				}
			}
			
			Object returnObj = pjp.proceed();
			
			
			return returnObj;
		}
}
