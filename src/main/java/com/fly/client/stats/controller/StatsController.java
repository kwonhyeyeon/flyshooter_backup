package com.fly.client.stats.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.stats.service.StatsService;
import com.fly.client.stats.vo.StatsVO;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;


@Controller
@RequestMapping(value = "/mypage")
public class StatsController {

	@Resource(name = "clientPlaceService")
	private ClientPlaceService placeService;
	@Resource(name = "StatsService")
	private  StatsService statsService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/stats.do", method = RequestMethod.GET)
	public String placeChoice_ClientChk(Model model, HttpSession session, HttpServletRequest request, @RequestParam(value = "year", required = true, defaultValue = "0") String year) {
		System.out.println("stats 호출 성공");

		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		PlaceVO pvo = new PlaceVO();
		pvo.setM_id(m_id);
		
		String selectYear = "";
		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);

		StatsVO svo = null;
		List<String> statisics = new ArrayList<String>();
		
		List<Integer> years = new ArrayList<Integer>();
		
		PlaceVO ypvo = placeService.selectYear(pvo);
		
		int minYear = Integer.parseInt(ypvo.getP_holiday_start());
		int maxYear = Integer.parseInt(ypvo.getP_holiday_end());
		
		for(int i = minYear; i <= maxYear; i++) {
			years.add(i);
		}
		model.addAttribute("years", years);
		
		if( "0".equals(year) ) {
			selectYear = ypvo.getP_holiday_end();
		}else {
			selectYear = year;
		}
		model.addAttribute("selectYear", selectYear);
		for( PlaceVO pvo2 : placeChoice ) {
			svo = new StatsVO();
			svo.setP_num(pvo2.getP_num());
			svo.setYear(selectYear);
			statisics.add(statsService.placeStatus(svo)); 
		}
		
		model.addAttribute("place", placeChoice);
		model.addAttribute("statisics", statisics);
		try {
			model.addAttribute("cnt", statisics.size());
		}catch(Exception e) {
			model.addAttribute("cnt", 0);
		}
		
		return "mypage/stats";
	}
	
	// 온라인대관 환불요청
	@RequestMapping(value = "/stadiumStats.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String stadiumStats(@ModelAttribute StatsVO stvo) {

		StringBuffer result = new StringBuffer();
		
		List<Integer> s_noList = new ArrayList();
		
		s_noList = statsService.selectStadiumNo(stvo);
		
		// 경기장이 없을경우
		if( s_noList.isEmpty() ) {
			result.append("Empty");
			return result.toString();
		}
		for( int s_no : s_noList ) {
			
			stvo.setS_no(s_no);
			
			result.append(statsService.stadiumStatus(stvo));
			// 구분자로 사용
			result.append("@@");
		}
		
		
		return result.toString();
	}

	
	
	
}
