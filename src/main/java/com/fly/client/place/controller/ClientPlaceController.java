package com.fly.client.place.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.member.place.vo.PlaceVO;

@Controller
@RequestMapping("/mypage")
public class ClientPlaceController {
	private Logger log = LoggerFactory.getLogger(ClientPlaceController.class);
	
	@Autowired
	private ClientPlaceService clientPlaceService;
	
	//구장 목록 구현하기
	@RequestMapping(value="/placeList.do" , method = RequestMethod.GET)
	public String placeList(Model model) {
		log.info("placeList 호출 성공");
		
		List<PlaceVO> placeList	= clientPlaceService.placeList();
		model.addAttribute("placeList", placeList);
		model.addAttribute("data");
		return "mypage/placeList";
	}
	
	//구장 약관 동의 페이지 출력하기
	@RequestMapping(value="/placecheck.do")
	public String checkForm() {
		log.info("placeCheck 호출 성공");
		return "mypage/placecheck";
				
	}
	
	//구장 등록 페이지 출력하기
	@RequestMapping(value="/placeForm.do")
	public String writeForm() {
		log.info("placeForm 호출 성공");
		return "mypage/placeForm";
	}
	
	//글 쓰기 구현하기
	
	@RequestMapping(value="/placeInsert.do", method=RequestMethod.POST)
	public String placeInsert(@ModelAttribute PlaceVO pvo, Model model) {
		log.info("placeInsert 호출 성공");
		int result = 0;
		String url = "";
		
		result = clientPlaceService.placeInsert(pvo);
		if(result == 1) {
			url = "/mypage/placeList.do";
		}else {
			model.addAttribute("code", 1);
			url = "/mypage/placeForm.do";
		}
		return "redirect:"+url;
	}
	
	
}
