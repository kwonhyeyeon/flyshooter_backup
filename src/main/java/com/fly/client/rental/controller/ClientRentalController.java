package com.fly.client.rental.controller;

import java.util.List;

<<<<<<< HEAD
import javax.annotation.Resource;

=======
import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> 40299a269fce65f337823f3f163a5a74079df47d
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
<<<<<<< HEAD

	@Resource(name = "clientPlaceService")
=======
	
	@Autowired
>>>>>>> 40299a269fce65f337823f3f163a5a74079df47d
	private ClientPlaceService clientPlaceService;
	
	@RequestMapping(value="/rentalList.do", method = RequestMethod.GET)
	public String stadiumList(@ModelAttribute StadiumVO svo, Model model, @RequestParam(value="p_name", required = true, defaultValue = "null") String p_name) {
		model.addAttribute("m_id", "aaa@naver.com");
	    model.addAttribute("m_type", 0);
	    
	    List<StadiumVO> stadiumList = clientPlaceService.stadiumList(p_name);
	      
	    return "rental/rentalList";
	}

}
