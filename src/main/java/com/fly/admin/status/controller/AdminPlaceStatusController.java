package com.fly.admin.status.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.admin.status.service.AdminPlaceStatusService;
import com.fly.admin.status.vo.AdminPlaceStatusVO;

@Controller
@RequestMapping(value = "/admin/placestatus")
public class AdminPlaceStatusController {

	@Resource(name = "AdminPlaceStatusService")
	private AdminPlaceStatusService adminPlaceStatusService;

	@RequestMapping(value = "/placeStatus.do", method = RequestMethod.GET)
	public String selectPlaceChk(@ModelAttribute AdminPlaceStatusVO svo, HttpServletRequest request, Model model) {

		System.out.println("placeStatus 호출");
		
		String result = "";

		List<AdminPlaceStatusVO> selectPlace = adminPlaceStatusService.selectPlace(svo);
		model.addAttribute("selectPlace", selectPlace);

		return "admin/placestatus/placeStatus";
	}
	
}
