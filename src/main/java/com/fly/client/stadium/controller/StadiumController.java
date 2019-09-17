package com.fly.client.stadium.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.client.items.service.ItemsService;
import com.fly.client.items.vo.ItemsVO;
import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.stadium.dao.ClientStadiumDao;
import com.fly.client.stadium.service.ClientStadiumService;
import com.fly.client.util.MakeList;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;

//import com.fly.client.stadium.service.StadiumService;

@Controller
@RequestMapping(value = "/mypage")
public class StadiumController {

	@Autowired
	private ClientStadiumService stadiumService;

	@Autowired
	private ClientPlaceService placeService;

	@Autowired
	private ItemsService itemsService;
	
	// 구장 목록 구현하기
	@RequestMapping(value = "/placeChoice.do", method = RequestMethod.GET)
	public String placeChoice(Model model, HttpSession session) {
		System.out.println("placeChoice 호출 성공");

		String m_id = (String) session.getAttribute("m_id");

		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);

		model.addAttribute("placeChoice", placeChoice);
		model.addAttribute("data");
		return "mypage/stadiumList";
	}

	
	
	@RequestMapping(value = "/stadiumList.do", method = RequestMethod.GET, produces= "text/html; charset=UTF-8")
	@ResponseBody
	public String stadiumList(Model model, @RequestParam(value = "p_num") String p_num) {
		System.out.println("stadiumList 호출 성공");
		List<StadiumVO> Slist = stadiumService.stadiumList(p_num);
		List<ItemsVO> Ilist = itemsService.itemsList(p_num);
		return MakeList.makeList(Slist, Ilist, p_num);
	}

	/*
	 * // 구장 상세보기
	 * 
	 * @RequestMapping(value = "/stadiumDetail.do", method = RequestMethod.POST)
	 * public ModelAndView stadiumDetail(@ModelAttribute StadiumVO svo, HttpSession
	 * session) { System.out.println("stadiumDetail 호출 성공");
	 * 
	 * ModelAndView mav = new ModelAndView(); int s_no = svo.getS_no(); svo =
	 * stadiumService.stadiumDetail(s_no);
	 * 
	 * mav.addObject("s_no", svo.getS_no()); mav.addObject("s_name",
	 * svo.getS_name()); mav.addObject("s_size", svo.getS_size());
	 * mav.addObject("s_d_fee", svo.getS_d_fee()); mav.addObject("s_n_fee",
	 * svo.getS_n_fee()); mav.addObject("s_d_fee_w", svo.getS_d_fee_w());
	 * mav.addObject("s_n_fee_w", svo.getS_n_fee_w()); mav.addObject("s_people",
	 * svo.getS_people()); mav.addObject("s_img1", svo.getS_img1());
	 * mav.addObject("s_img2", svo.getS_img2()); mav.addObject("s_img3",
	 * svo.getS_img3()); mav.addObject("s_in_out", svo.getS_in_out());
	 * mav.addObject("s_status", svo.getS_status()); mav.addObject("s_hours",
	 * svo.getS_hours()); mav.addObject("s_regdate", svo.getS_regdate());
	 * 
	 * mav.setViewName("mypage/stadiumDetailEdit");
	 * 
	 * return mav; }
	 */

	// 경기장 등록 페이지 출력하기
	@RequestMapping(value = "/stadiumForm.do", method = RequestMethod.GET)
	public String writeForm(@RequestParam("p_num") String p_num, Model model) {
		System.out.println("stadiumForm 호출 성공");
		System.out.println(p_num);
		model.addAttribute("p_num", p_num);
		return "mypage/stadiumForm";
	}

	// 경기장 등록
	@RequestMapping(value = "/stadiumInsert.do", method = RequestMethod.POST)
	public ModelAndView stadiumInsert(@ModelAttribute StadiumVO svo, @RequestParam("select") String select) {
		System.out.println("stadiumInsert 호출 성공");
		System.out.println(svo.toString());
		ModelAndView mav = new ModelAndView();
		int result = stadiumService.stadiumInsert(svo);
		int plus = Integer.parseInt(select);// 추가등록여부 확인을 위한 변수
		System.out.println(result);
		if (result == 1) {
			if (plus == 1) {
				mav.addObject("p_num", svo.getP_num());
				mav.setViewName("mypage/stadiumForm");
			} else {
				mav.setViewName("mypage/modifyLogin");
			}
		} else {
			mav.addObject("errCode", 1);
			mav.setViewName("mypage/stadiumForm");
		}
		return mav;
	}
}
