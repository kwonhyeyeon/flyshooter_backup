package com.fly.client.place.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

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

import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;

@Controller
@RequestMapping("/mypage")
public class ClientPlaceController {

	@Autowired
	private ClientPlaceService clientPlaceService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
	public String placeList(Model model,
			@RequestParam(value = "errCode", required = false, defaultValue = "0") String errCode) {
		System.out.println("placeList 호출 성공");

		List<PlaceVO> placeList = clientPlaceService.placeList();
		model.addAttribute("placeList", placeList);
		model.addAttribute("data");
		model.addAttribute("errCode", errCode);
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
		// session에서 가져오기
		String m_id = (String) session.getAttribute("m_id");
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
	
	//구장 사업자번호  중복 체크 메서드
	@ResponseBody
	@RequestMapping(value= "/pnumConfirm.do", method = RequestMethod.POST)
	public String pnumConfirm(@RequestParam ("p_num")String p_num) {
		System.out.println("pnumConfirm 호출 성공");
		int result = clientPlaceService.pnumConfirm(p_num);
		return result + "";
	}
	
	
	// 구장 상세보기
	@RequestMapping(value = "/placeDetail.do", method = RequestMethod.POST)
	public ModelAndView placeDetail(@ModelAttribute PlaceVO pvo, Model model, HttpSession session) {
		System.out.println("placeDetail 호출 성공");

		ModelAndView mav = new ModelAndView();
		String p_num = pvo.getP_num();
		pvo = clientPlaceService.placeDetail(p_num);
		String word = pvo.getP_address();
		String[] address = word.split("\\*");

		mav.addObject("p_name", pvo.getP_name());
		mav.addObject("p_ceo", pvo.getP_ceo());
		mav.addObject("p_num", pvo.getP_num());
		mav.addObject("p_phone", pvo.getP_phone());
		mav.addObject("sample6_postcode", address[0]);
		mav.addObject("sample6_address", address[1]);
		mav.addObject("sample6_detailAddress", address[2]);
		mav.addObject("sample6_extraAddress", address[3]);
		mav.addObject("p_bank", pvo.getP_bank());
		mav.addObject("p_account", pvo.getP_account());
		mav.addObject("p_account_num", pvo.getP_account_num());
		mav.addObject("p_holiday", pvo.getP_holiday());
		mav.addObject("p_holiday_start", pvo.getP_holiday_start());
		mav.addObject("p_holiday_end", pvo.getP_holiday_end());
		mav.addObject("p_open", pvo.getP_open());
		mav.addObject("p_close", pvo.getP_close());
		mav.addObject("p_status", pvo.getP_status());
		mav.addObject("p_file", pvo.getP_file());
		mav.addObject("p_intro", pvo.getP_intro());

		mav.setViewName("mypage/placeDetailEdit");

		return mav;
	}

	@RequestMapping(value = "/placeModify.do", method = RequestMethod.POST)
	public String placeModify(@ModelAttribute PlaceVO pvo, Model model, HttpSession session) {
		System.out.println("placeModify 호출 성공");

		int result = 0;
		String url = "";
		result = clientPlaceService.placeModify(pvo);
		if (result == 1) {
			url = "placeList.do";
		} else {
			model.addAttribute("errCode", 1);
			url = "placeList.do";
		}
		return "redirect:" + url;
	}

	@RequestMapping(value = "/closePlace.do", method = RequestMethod.POST)
	@ResponseBody
	public String closePlace(@RequestParam(value = "p_num", required = false, defaultValue = "0") String p_num) {
		System.out.println("closePlace 호출 성공");
		int result = clientPlaceService.closePlace(p_num);
		return result + "";
	}
}
