package com.fly.client.calculate.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.client.calculate.service.ClientCalculateService;
import com.fly.client.calculate.vo.CalculateVO;
import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.rental.service.ClientRentalService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;

@Controller
@RequestMapping(value = "/mypage")
public class ClientCalculateController {

	@Resource(name = "calculateService")
	private ClientCalculateService calculateService;

	@Resource(name = "clientRentalService")
	private ClientRentalService clientRentalService;
	
	@Autowired
	HttpServletRequest request;

	// 정산 리스트 구현하기
	@RequestMapping(value = "/calculate.do", method = RequestMethod.GET)
	public String calculate(Model model, HttpSession session) {
		System.out.println("calculate 호출 성공");

		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		List<CalculateVO> calculateIList = calculateService.calculateIList(m_id);
		List<CalculateVO> calculateList = calculateService.calculateList(m_id);
	
		model.addAttribute("calculateIList", calculateIList);
		model.addAttribute("calculateList", calculateList);
		return "mypage/calculate";
	}
	
	// 정산 신청 구현하기
	@RequestMapping(value = "/calculateInsert.do", method = RequestMethod.POST)
	public String CalculateInsert(Model model, @ModelAttribute CalculateVO cvo) {
		System.out.println("calculateInsert 호출 성공");
		String result = calculateService.calculateInsert(cvo)+"";
		System.out.println("pRentalUpdae 호출 성공");
		String result1 = calculateService.pRentalUpdae(cvo.getP_num())+"";
		
		System.out.println(result);
		if (result != "1") {
			model.addAttribute("errCode", 1);
		}
		return "redirect:/mypage/calculate.do";
	}
}
