package com.fly.client.place.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;

@Controller
@RequestMapping("/mypage")
public class ClientPlaceController {

	@Autowired
	private ClientPlaceService clientPlaceService;

	// 구장 목록 구현하기
	@RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
	public String placeList_ClientChk(Model model,HttpServletRequest request,
			@RequestParam(value = "errCode", required = false, defaultValue = "0") String errCode, 
			HttpSession session, @ModelAttribute PlaceVO pvo) {
		System.out.println("placeList 호출 성공");
		
		// session에서 가져오기
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		pvo.setM_id(m_id);
		
		List<PlaceVO> placeList = clientPlaceService.placeList(pvo);
		model.addAttribute("placeList", placeList);
		model.addAttribute("data");
		model.addAttribute("errCode", errCode);
		return "mypage/placeList";
	}

	// 구장 약관 동의 페이지 출력하기
	@RequestMapping(value = "/placecheck.do")
	public String checkForm_ClientChk(HttpServletRequest request) {
		System.out.println("placeCheck 호출 성공");
		return "mypage/placecheck";

	}

	// 구장 등록 페이지 출력하기
	@RequestMapping(value = "/placeForm.do")
	public String writeForm_ClientChk(HttpServletRequest request) {
		System.out.println("placeForm 호출 성공");
		return "mypage/placeForm";
	}

	// 글 쓰기 구현하기

	@RequestMapping(value = "/placeInsert.do", method = RequestMethod.POST)
	public String placeInsert_ClientChk(@ModelAttribute PlaceVO pvo, Model model, HttpSession session
			,HttpServletRequest request) {

		System.out.println("placeInsert 호출 성공");
		int result = 0;
		String url = "";
		// session에서 가져오기
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		pvo.setM_id(m_id);
		String p_num = pvo.getP_num();
		System.out.println(pvo.getP_bank());
		result = clientPlaceService.placeInsert(pvo);
		if (result == 1) {
			model.addAttribute("p_num",p_num);
			return "/mypage/stadiumForm";
		} 
			model.addAttribute("code", 1);
			return "/mypage/placeForm";
		

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
	public ModelAndView placeDetail_ClientChk(@ModelAttribute PlaceVO pvo, Model model
			, HttpSession session,HttpServletRequest request) {
		System.out.println("placeDetail 호출 성공");

		ModelAndView mav = new ModelAndView();
		String p_num = pvo.getP_num();
		pvo = clientPlaceService.placeDetail(p_num);
		String word = pvo.getP_address();
		String[] address = word.split("\\*");

		mav.addObject("sample6_postcode", address[0]);
		mav.addObject("sample6_address", address[1]);
		try {
		mav.addObject("sample6_detailAddress", address[2]);
		mav.addObject("sample6_extraAddress", address[3]);
		}catch(Exception e) {
			mav.addObject("sample6_detailAddress", "");
			mav.addObject("sample6_extraAddress", "");
		}
		mav.addObject("pvo", pvo);
		mav.setViewName("mypage/placeDetailEdit");

		return mav;
	}

	@RequestMapping(value = "/placeModify.do", method = RequestMethod.POST)
	public String placeModify_ClientChk(@ModelAttribute PlaceVO pvo, Model model
			, HttpSession session,HttpServletRequest request) {
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
		System.out.println(p_num);
		int result = clientPlaceService.closePlace(p_num);
		System.out.println(result);
		return result + "";
	}
}
