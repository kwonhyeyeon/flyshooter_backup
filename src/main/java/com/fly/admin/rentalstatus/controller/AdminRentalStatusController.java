package com.fly.admin.rentalstatus.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.admin.rentalstatus.service.AdminRentalStatusService;
import com.fly.admin.rentalstatus.vo.AdminRentalStatusVO;

@Controller
@RequestMapping(value = "/admin/rentalstatus")
public class AdminRentalStatusController {
	
	@Resource(name = "AdminRentalStatusService")
	private AdminRentalStatusService adminRentalStatusService;
	
	@RequestMapping(value = "/rentalStatus.do", method = RequestMethod.GET)
	public String selectRentalChk(@ModelAttribute AdminRentalStatusVO rvo, HttpServletRequest request, Model model) {
		
		System.out.println("rentalStatus 호출");
		
		String result = "";
		
		List<AdminRentalStatusVO> selectRental = adminRentalStatusService.selectRental(rvo);
		model.addAttribute("selectRental", selectRental);
		
		return "admin/rentalstatus/rentalStatus";
	}
	

}
