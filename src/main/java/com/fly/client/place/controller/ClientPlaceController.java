package com.fly.client.place.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.place.vo.PlaceVO;

@Controller
@RequestMapping("/mypage")
public class ClientPlaceController {

	@Autowired
	private ClientPlaceService clientPlaceService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
	public String placeList(Model model) {
		System.out.println("placeList 호출 성공");

		List<PlaceVO> placeList = clientPlaceService.placeList();
		model.addAttribute("placeList", placeList);
		model.addAttribute("data");
		return "mypage/placeList";
	}

	// 구장 약관 동의 페이지 출력하기
	@RequestMapping(value = "/placecheck.do")
	public String checkForm() {
		System.out.println("placeCheck 호출 성공");
		return "mypage/placecheck";

	}

	// 구장 등록 페이지 출력하기
	@RequestMapping(value = "/placeForm.do")
	public String writeForm() {
		System.out.println("placeForm 호출 성공");
		return "mypage/placeForm";
	}


	// 글 쓰기 구현하기

	@RequestMapping(value = "/placeInsert.do", method = RequestMethod.POST)
	public String placeInsert(@ModelAttribute PlaceVO pvo, Model model, HttpSession session) {

		System.out.println("placeInsert 호출 성공");
		int result = 0;
		String url = "";
		//session에서 가져오기
		String	m_id = (String) session.getAttribute("m_id");
		System.out.println(m_id);
		pvo.setM_id(m_id);
		result = clientPlaceService.placeInsert(pvo);
		if (result == 1) {
			url = "/mypage/placeList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/mypage/placeForm.do";
		}
		return "redirect:" + url;
	}

	@RequestMapping(value = "/placeDetail.do", method = RequestMethod.POST)
	public ModelAndView placeDetail(@ModelAttribute PlaceVO pvo, Model model, HttpSession session) {
		System.out.println("placeDetail 호출 성공");

		ModelAndView mav = new ModelAndView();
		String p_num = pvo.getP_num();
		System.out.println(pvo.getP_name()+"1");
		System.out.println(pvo.getP_name()+"2");
		mav.addObject("p_name", pvo.getP_name());
		mav.addObject("p_ceo", pvo.getP_ceo());
		mav.addObject("p_num", pvo.getP_num());
		mav.addObject("p_phone", pvo.getP_phone());
		mav.addObject("p_address", pvo.getP_address());
		mav.addObject("p_bank", pvo.getP_bank());
		mav.addObject("p_account", pvo.getP_account());
		mav.addObject("p_account_num", pvo.getP_account_num());
		mav.addObject("p_holiday", pvo.getP_holiday());
		mav.addObject("p_open", pvo.getP_open());
		mav.addObject("p_close", pvo.getP_close());
		mav.addObject("p_status", pvo.getP_status());
		mav.addObject("p_file", pvo.getP_file());
		mav.addObject("p_intro", pvo.getP_intro());
		
		
		mav.setViewName("mypage/placeDetail");
	
		return mav;
	}

}
