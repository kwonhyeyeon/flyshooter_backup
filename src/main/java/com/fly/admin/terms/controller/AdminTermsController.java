package com.fly.admin.terms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.admin.terms.service.AdminTermsService;
import com.fly.admin.terms.vo.TermsVO;

@Controller
@RequestMapping(value = "/admin/terms")
public class AdminTermsController {
	
	@Autowired
	private AdminTermsService adminTermsService;

	// 저장된 값 불러오기
	@RequestMapping(value = "/terms.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String termsFormChk(
			Model model,
			HttpServletRequest request,
			@ModelAttribute TermsVO tvo
			) {
		System.out.println("terms 호출 성공");
		
		int ctype = tvo.getCtype();
		
		if(ctype == 1) {
			tvo = adminTermsService.getTerms(ctype);
			model.addAttribute("tvo", tvo);
			model.addAttribute("ctype", 1);
			System.out.println(ctype);
			
			return "/admin/terms/access";
		} else {
			tvo = adminTermsService.getTerms(ctype);
			model.addAttribute("tvo", tvo);
			model.addAttribute("ctype", 2);
			System.out.println(ctype);
			
			return "/admin/terms/privacy";
		}
		
	}
	
	// 내용 수정
	@RequestMapping(value = "/access.do", method = RequestMethod.POST)
	public String updateTermsChk(
			@ModelAttribute TermsVO tvo,
			RedirectAttributes redirectAttr,
			HttpServletRequest request
			) {
		System.out.println("updateTermsChk 호출 성공");
		
		adminTermsService.updateTerms(tvo);
		redirectAttr.addAttribute("ctype", tvo.getCtype());
		
		return "redirect:/admin/terms/terms.do";
	}
	
}
