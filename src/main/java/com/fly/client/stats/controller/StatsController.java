package com.fly.client.stats.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.client.items.vo.ItemsVO;
import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.stadium.service.ClientStadiumService;
import com.fly.client.stats.service.StatsService;
import com.fly.client.stats.vo.StatsVO;
import com.fly.client.util.MakeList;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;

import com.fly.user.rental.service.UserRentalService;

@Controller
@RequestMapping(value = "/mypage")
public class StatsController {

	@Autowired
	private ClientPlaceService placeService;
	
	@Autowired
	private  StatsService statsService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/stats.do", method = RequestMethod.GET)
	public String placeChoice_ClientChk(Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("stats 호출 성공");

		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);

		model.addAttribute("placeChoice", placeChoice);
		model.addAttribute("data");
		return "mypage/stats";
	}
	//통계
	@RequestMapping(value="/stadiumstats.do", method = RequestMethod.GET)
	public String stadiumstats_ClientChk(Model model , HttpSession session, StatsVO stvo
			, HttpServletRequest request) {
		System.out.println("stadiumstats 호출 성공");
		
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		List<StatsVO> states= statsService.stadiumstats(stvo);
		
		model.addAttribute("states", states);
	
		return "mypage/stadiumstats";
	}
	
}
