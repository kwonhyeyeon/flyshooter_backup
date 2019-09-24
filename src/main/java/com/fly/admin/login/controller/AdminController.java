package com.fly.admin.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.admin.login.service.AdminLoginService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Resource(name = "adminLoginService")
	private AdminLoginService adminLoginService;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 실행시 adminlogin.jsp로 연결시켜주는 맵핑 (test를 위하여 만듬)
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String adminlogin(HttpSession session, HttpServletRequest request) {
		return "admin/login";
	}

	// 로그인버튼 클릭시 ID검사및 세션값 저장을 담당
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String adminlogin(HttpSession session, HttpServletRequest request, @RequestParam(value = "adminId") String adminId,
			@RequestParam(value = "adminPw") String adminPw) {
		
		boolean loginPass;
		
		loginPass = loginCheck(adminId, adminPw);
		if (loginPass) {
			session.setAttribute("adminId", adminId);
			
			return "redirect:/admin/main.do";
		}

		return "admin/login";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request){
		session.invalidate();
		session = request.getSession(true);
		return "admin/login";
	}
	
	private boolean loginCheck(String adminId, String adminPw) {
		// TODO Auto-generated method stub
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
