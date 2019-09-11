package com.fly.client.stadium.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.fly.client.stadium.service.StadiumService;

@Controller
@RequestMapping("/mypage")
public class StadiumController {
	
	@Autowired
	//private StadiumService stadiumService;
	
	//경기장 등록 페이지 출력하기
	@RequestMapping(value = "/stadiumForm.do")
	public String writeForm() {
		System.out.println("stadiumForm 호출 성공");
		return "mypage/stadiumForm";
	}
}
