package com.fly.admin.stadium.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.admin.stadium.service.AdminStadiumService;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;

@Controller
@RequestMapping(value = "/admin/stadium")
public class AdminStadiumController {

	@Resource(name = "adminStadiumService")
	private AdminStadiumService adminStadiumService;
	
	// 경기장 상세 정보
	@RequestMapping(value = "/stadiumDetail.do", method = RequestMethod.GET)
	public String getStadiumDetailChk(
			HttpServletRequest request,
			Model model,
			@ModelAttribute StadiumVO svo,
			@ModelAttribute PlaceVO pvo
			) {
		System.out.println("getStadiumDetailChk 호출 성공");
		
		int s_no = svo.getS_no();
		svo = adminStadiumService.getStadiumDetail(s_no);
		model.addAttribute("svo", svo);
		
		model.addAttribute("p_ok", pvo.getP_ok());
		model.addAttribute("p_status", pvo.getP_status());
		
		return "/admin/place/stadiumDetail";
	}
	
	// 경기장 승인 update
	@RequestMapping(value = "/stadiumAccept.do", method = RequestMethod.POST)
	public String updateStdmAcceptChk(
			HttpServletRequest request,
			@ModelAttribute StadiumVO svo,
			@ModelAttribute PlaceVO pvo,
			RedirectAttributes redirectAttr
			) {
		
		System.out.println("updateStdmAcceptChk 호출 성공");
		
		int s_no = svo.getS_no();
		adminStadiumService.updateStdmAccept(s_no);
		redirectAttr.addAttribute("s_no", s_no);
		redirectAttr.addAttribute("p_status", pvo.getP_status());
		redirectAttr.addAttribute("p_ok", pvo.getP_ok());
		
		return "redirect:/admin/stadium/stadiumDetail.do";
		
	}
	
}
