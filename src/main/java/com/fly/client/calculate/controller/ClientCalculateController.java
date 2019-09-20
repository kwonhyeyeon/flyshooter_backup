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
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;

@Controller
@RequestMapping(value = "/mypage")
public class ClientCalculateController {

	@Resource(name = "calculateService")
	private ClientCalculateService calculateService;

	@Autowired
	private ClientPlaceService placeService;

	@Autowired
	HttpServletRequest request;

	// 정산 리스트 구현하기
	@RequestMapping(value = "/calculate.do", method = RequestMethod.GET)
	public String calculate(Model model, HttpSession session) {
		System.out.println("calculate 호출 성공");

		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);
		List<CalculateVO> calculateList = calculateService.CalculateList(m_id);
	
		model.addAttribute("placeChoice", placeChoice);
		model.addAttribute("calculateList", calculateList);
		return "mypage/calculate";
	}


	// 정산 지급액 계산하기
	@RequestMapping(value = "/calculateTotal.do", method = RequestMethod.GET, produces= "text/html; charset=UTF-8")
	@ResponseBody
	public String CalculateTotal(Model model, @RequestParam(value = "p_num") String p_num) {
		System.out.println("calculateTotal 호출 성공");
		
		return "1";
	}
	
	// 정산 신청 구현하기
	@RequestMapping(value = "/calculateInsert.do", method = RequestMethod.GET)
	public String CalculateInsert(Model model, @RequestParam(value = "p_num") String p_num) {
		System.out.println("calculateInsert 호출 성공");
		CalculateVO cvo = new CalculateVO();
		
		
		cvo.setP_num(p_num);
		cvo.setC_payment(1);
		cvo.setC_rental_cnt(1);
		cvo.setC_return_cnt(2);
		String result = calculateService.CalculateInsert(cvo)+"";
		System.out.println(result);
		if (result != "1") {
			model.addAttribute("errCode", 1);
		}
		return "redirect:/mypage/calculate.do";
	}
}
