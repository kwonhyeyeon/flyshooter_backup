package com.fly.client.stats.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;

@Controller
@RequestMapping(value = "/mypage")
public class StatsController {

	@Autowired
	private ClientPlaceService placeService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/stats.do", method = RequestMethod.GET)
	public String placeChoice(Model model, HttpSession session) {
		System.out.println("stats 호출 성공");

		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);

		model.addAttribute("placeChoice", placeChoice);
		model.addAttribute("data");
		return "mypage/stats";
	}
}
