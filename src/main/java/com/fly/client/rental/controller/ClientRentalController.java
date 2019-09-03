package com.fly.client.rental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.member.stadium.vo.StadiumVO;

@Controller
@RequestMapping(value="/rental")
public class ClientRentalController {
	
	@Autowired
	private ClientPlaceService clientPlaceService;
	
	@RequestMapping(value="/rentalList.do", method = RequestMethod.GET)
	public String stadiumList(@ModelAttribute StadiumVO svo, Model model, @RequestParam(value="p_name", required = true, defaultValue = "null") String p_name) {
		model.addAttribute("m_id", "aaa@naver.com");
	    model.addAttribute("m_type", 0);
	    
	    List<StadiumVO> stadiumList = clientPlaceService.stadiumList(p_name);
	      
	    return "rental/rentalList";
	}

}
