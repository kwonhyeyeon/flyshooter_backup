package com.fly.admin.login.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.admin.login.service.AdminLoginService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	// 로그인시도 횟수가 5회 이상일경우 현재시간을 밀리세컨드로 저장시킬 변수.
	private long time = 0;
	
	@Resource(name = "adminLoginService")
	private AdminLoginService adminLoginService;
	
	
	// 실행시 adminlogin.jsp로 연결시켜주는 맵핑 (test를 위하여 만듬)
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String adminlogin(HttpSession session, HttpServletRequest request) {
		return "admin/login";
	}

	// 로그인버튼 클릭시 ID검사및 세션값 저장을 담당
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String adminlogin(HttpSession session, HttpServletRequest request, @RequestParam(value = "adminId") String adminId,
			@RequestParam(value = "adminPw") String adminPw, Model model) {
		
		int tryCnt = 0;
		long now = System.currentTimeMillis();
		
		// 30초동안 로그인 잠금.
		if ((now - time) <= 30000 ) {
			model.addAttribute("error_msg", "5회 연속 실패로 로그인이 잠겼습니다.<br />" + ( 30 - (now - time)/1000 ) + "초 후에 시도해주십시오.");
			
			session.removeAttribute("tryCnt");
			return "admin/login";
		}
		
		try {
			tryCnt = (int)session.getAttribute("tryCnt");
		}catch(NullPointerException e) {
			tryCnt = 0;
			session.setAttribute("tryCnt", 1);
		}
		
		// 세션에 저장된 값이 없을경우.
		if(tryCnt >= 0) {
			session.setAttribute("tryCnt", ++tryCnt);
		}
		
		if( tryCnt == 5 ) {
			// 전역변수에 저장함으로써 모든 클라이언트에서 동일하게 30초동안 잠기도록 구현하였다.
			time = System.currentTimeMillis(); 
		}
		
		
		if ( loginCheck(adminId, adminPw) ) {
			session.removeAttribute("tryCnt");
			session.setAttribute("adminId", adminId);
			
			return "redirect:/admin/main.do";
		}
		
		model.addAttribute("tryCnt", tryCnt);
		model.addAttribute("error_msg", "로그인 정보가 틀렸습니다. <br />시도횟수 " + tryCnt + "회");
		return "admin/login";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request){
		session.invalidate();
		session = request.getSession(true);
		return "admin/login";
	}
	
	
	private boolean loginCheck(String adminId, String adminPw) {
		boolean loginPass = false;
		if ("admin".equals(adminId) && "admin1234".equals(adminPw)) {
			loginPass = true;
		}
		return loginPass;
	}
	
	
	// 로그인 시 이동 페이지, 메인화면 누적 통계
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET})
	public String mainChk(HttpSession session, HttpServletRequest request,Model model) {
		
		model.addAttribute("stt", adminLoginService.getStatistics());

		return "admin/main";
	}

}
