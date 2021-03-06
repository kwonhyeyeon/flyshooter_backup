package com.fly.client.stats.controller;

import java.util.ArrayList;
import java.util.Calendar;
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
	private StatsService statsService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/stats.do", method = RequestMethod.GET)
	public String placeChoice_ClientChk(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "year", required = true, defaultValue = "0") String year) {

		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();

		PlaceVO pvo = new PlaceVO();
		pvo.setM_id(m_id);

		String selectYear = "";
		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);
		if( placeChoice.isEmpty() ) {
			
			model.addAttribute("message", "등록된 구장이 없습니다");
			return "mypage/placeList";
		}

		StatsVO svo = null;
		List<String> statisics = new ArrayList<String>();

		List<Integer> years = new ArrayList<Integer>();

		PlaceVO ypvo = placeService.selectYear(pvo);
		try {
			int minYear = Integer.parseInt(ypvo.getP_holiday_start());
			int maxYear = Integer.parseInt(ypvo.getP_holiday_end());
			for (int i = minYear; i <= maxYear; i++) {
				years.add(i);
			}
			model.addAttribute("years", years);

			if ("0".equals(year)) {
				selectYear = ypvo.getP_holiday_end();
			} else {
				selectYear = year;
			}
			model.addAttribute("selectYear", selectYear);

		} catch (NullPointerException e) {
			years.add(Calendar.getInstance().get(Calendar.YEAR));
			model.addAttribute("years", years);
		}

		for (PlaceVO pvo2 : placeChoice) {
			svo = new StatsVO();
			svo.setP_num(pvo2.getP_num());
			svo.setYear(selectYear);
			statisics.add(statsService.placeStatus(svo));
		}

		model.addAttribute("place", placeChoice);
		model.addAttribute("statisics", statisics);
		try {
			model.addAttribute("cnt", statisics.size());
		} catch (Exception e) {
			model.addAttribute("cnt", 0);
		}

		return "mypage/stats";
	}

	// 구장별 경기장의 통계
	@RequestMapping(value = "/stadiumStats.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String stadiumStats(@ModelAttribute StatsVO stvo) {

		StringBuffer result = new StringBuffer();

		List<Integer> s_noList = new ArrayList();

		s_noList = statsService.selectStadiumNo(stvo);

		// 경기장이 없을경우
		if (s_noList.isEmpty()) {
			result.append("Empty");
			return result.toString();
		}
		for (int s_no : s_noList) {

			stvo.setS_no(s_no);

			result.append(statsService.stadiumStatus(stvo));
			// 구분자로 사용
			result.append("@@");
		}

		return result.toString();
	}

	// 전체 구장의 매출통계
	@RequestMapping(value = "/allPlaceSalesStatis.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String allPlaceSalesStatis(HttpSession session, @ModelAttribute StatsVO stvo) {

		StringBuffer result = new StringBuffer();
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		try {

			String m_id = sessionMvo.getM_id();

			List<PlaceVO> placeChoice = placeService.placeChoice(m_id);

			for (PlaceVO pvo : placeChoice) {
				stvo.setP_num(pvo.getP_num());
				result.append(statsService.allPlaceSales(stvo));
				result.append("@@");

			}
			// 등록된 구장이 없을경우 오류를 발생시켜 catch로 보낸다.
			if (placeChoice.isEmpty()) {
				placeChoice.get(5);
			}

			return result.toString();

		} catch (Exception e) {
			e.printStackTrace();
			result = new StringBuffer();
			result.append("Empty");
			return result.toString();
		}

	}
	// 전체 구장의 매출통계
	@RequestMapping(value = "/selectedPlaceSales.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String selectedPlaceSales(@ModelAttribute StatsVO stvo) {
		StringBuffer result = new StringBuffer();
		try {
		List<Integer> s_noList = new ArrayList();
					
		
		
		s_noList = statsService.selectStadiumNo(stvo);
		
		// 경기장이 없을경우
		if (s_noList.isEmpty()) {
				result.append("Empty");
				return result.toString();
			}
					
		for (Integer s_no : s_noList) {
			stvo.setS_no(s_no);
			result.append(statsService.selectedStadiumSales(stvo));
			result.append("@@");

		}
		}catch(Exception e) {
			e.toString();
			e.printStackTrace();
		}
		
		return result.toString();
					
					
					
		}
				
					
}
