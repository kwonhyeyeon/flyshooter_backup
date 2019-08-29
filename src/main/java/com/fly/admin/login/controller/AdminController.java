package com.fly.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller(value = "/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 실행시 adminlogin.jsp로 연결시켜주는 맵핑 (test를 위하여 만듬)
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String adminlogin() {
		return "admin/main";
	}

	// 로그인버튼 클릭시 ID검사및 세션값 저장을 담당
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.POST)
	public String adminlogin(HttpSession session, HttpServletRequest request ,@RequestParam(value = "adminId") String adminId,
			@RequestParam(value = "adminPw") String adminPw) {
		
		boolean loginPass;
		
		loginPass = loginCheck(adminId, adminPw);
		
		if (loginPass) {
			session.setAttribute("adminId", adminId);
		}

		return "admin/main";
	}
	
	private boolean loginCheck(String adminId, String adminPw) {
		// TODO Auto-generated method stub
		boolean loginPass = false;
		if ("admin".equals(adminId) && "admin1234".equals(adminPw)) {
			loginPass = true;
		}
		return loginPass;
	}

}
