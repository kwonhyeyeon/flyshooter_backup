package com.fly.admin.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin/info")
public class AdminInfoController {

	@RequestMapping(value = "/access.do", method = RequestMethod.GET)
	public String accessTermsChk(
			Model model,
			@RequestParam(value = "getData") String getData
			) {
		System.out.println("accessTerms 호출 성공");
		
		model.addAttribute("getData", getData);
		
		return "/admin/info/access";
	}
	
}
