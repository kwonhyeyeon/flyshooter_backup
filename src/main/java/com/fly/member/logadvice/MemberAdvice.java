package com.fly.member.logadvice;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.member.join.vo.MemberVO;
import com.fly.member.login.service.LoginService;

public class MemberAdvice {
   
   @Resource(name = "loginService")
   private LoginService loginService;
   
   // 회원의 로그인상태를 확인함
   public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable {
      System.out.println("login session chk");
      HttpServletRequest request = null;
      Model model = null;
      ModelAndView mav = new ModelAndView();
      
      
      
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
            
            mvo.getM_id();
                     
         }catch(NullPointerException e) {
            
            log_message = "로그인후 이용할수 있습니다.";
            request.setAttribute("log_message", log_message);
            
            if( pjp.getSignature().toString().contains("ModelAndView") ) {
               mav.setViewName("member/login");
               return mav;
            }
               return "member/login";
            
         }
      }
      Object returnObj = null;
      
       returnObj = pjp.proceed();
      
      
      
      return returnObj;
      }

   // 로그인 정보가 일반회원인지 검사
   public Object userCheck(ProceedingJoinPoint pjp) throws Throwable {
      System.out.println("user type chk");
      HttpServletRequest request = null;
      Model model = null;
      ModelAndView mav = new ModelAndView();
      
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
            
            
            int m_type = mvo.getM_type();
            if( m_type == 2 ) {
               // 사업자일경우 다른페이지로 리턴처리
               log_message = "사업자회원은 이용하실수 없습니다.";
               
               request.setAttribute("log_message", log_message);
               
               if( pjp.getSignature().toString().contains("ModelAndView") ) {
                  mav.setViewName("index");
                  return mav;
               }
               return "index";
               
            }
                     
         }catch(NullPointerException e) {
            log_message = "로그인후 이용할수 있습니다.";
            
            request.setAttribute("log_message", log_message);
            
            
            if( pjp.getSignature().toString().contains("ModelAndView") ) {
               mav.setViewName("member/login");
               return mav;
            }
               return "member/login";
               
         }
      }
      Object returnObj = pjp.proceed();
      
      
      return returnObj;
   }
   
   
      // 로그인 정보가 일반회원인지 검사
      public Object clientCheck(ProceedingJoinPoint pjp) throws Throwable {
         System.out.println("client type chk");
         HttpServletRequest request = null;
         Model model = null;
         ModelAndView mav = new ModelAndView();
         
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
               
               String m_id = mvo.getM_id();
                     
                  int todayRental = loginService.todayRental(m_id);
                  int passibleCal = loginService.passibleCal(m_id);
                  int unpaidCal = loginService.unpaidCal(m_id);
                     
                     session.setAttribute("todayRental", todayRental);
                     session.setAttribute("passibleCal", passibleCal);
                     session.setAttribute("unpaidCal", unpaidCal);
                        
               int m_type = mvo.getM_type();
               if( m_type == 1 ) {
                  // 일반회원일경우 다른페이지로 리턴처리
                  log_message = "일반회원은 이용하실수 없습니다.";
                  
                  request.setAttribute("log_message", log_message);
                  
                  
                  if( pjp.getSignature().toString().contains("ModelAndView") ) {
                     mav.setViewName("index");
                     return mav;
                  }
               return "index";
                  
               }
            }catch(NullPointerException e) {
               log_message = "로그인후 이용할수 있습니다.";
               
               request.setAttribute("log_message", log_message);
               
                  if( pjp.getSignature().toString().contains("ModelAndView") ) {
                     mav.setViewName("member/login");
                     return mav;
                  }
               return "member/login";
            }
         }
         Object returnObj = pjp.proceed();
         
         
         return returnObj;
      }
}