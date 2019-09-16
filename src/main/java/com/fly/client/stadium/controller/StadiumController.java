package com.fly.client.stadium.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fly.client.stadium.service.ClientStadiumService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.stadium.vo.StadiumVO;

//import com.fly.client.stadium.service.StadiumService;

@Controller
@RequestMapping(value = "/mypage")
public class StadiumController {

	@Autowired
	private ClientStadiumService stadiumService;

	// 경기장 등록 페이지 출력하기
	@RequestMapping(value = "/stadiumForm.do", method = RequestMethod.GET)
	public String writeForm() {
		System.out.println("stadiumForm 호출 성공");

		return "mypage/stadiumForm";
	}

	// 경기장 등록
	@RequestMapping(value = "/stadiumInsert.do", method = RequestMethod.POST)
	public ModelAndView stadiumInsert(@ModelAttribute StadiumVO svo, @RequestParam ("select")String select, 
			@RequestParam ("p_num")String p_num) {
		System.out.println("stadiumInsert 호출 성공");
		ModelAndView mav = new ModelAndView();
		int result = stadiumService.StadiumInsert(svo);
		int plus = Integer.parseInt(select);//추가등록여부 확인을 위한 변수
		if (result == 1) {
			if (plus == 1) {
				mav.addObject("p_num",p_num);
				mav.setViewName("mypage/stadiumForm");
			}else {
				mav.setViewName("mypage/modifyLogin");
			}
		} else {
			mav.addObject("code", 1);
			mav.setViewName("mypage/stadiumForm");
		}
		return mav;
	}
}
