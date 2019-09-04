package com.fly.user.rental.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.member.place.vo.PlaceVO;
import com.fly.user.place.service.UserPlaceService;
import com.fly.user.stadium.service.UserStadiumService;

@Controller
@RequestMapping(value = "/user/rental")
public class UserRentalController {
   
	@Resource(name="userPlaceService")
   private UserPlaceService placeService;
	@Resource(name = "userStadiumService")
	private UserStadiumService userStadiumService;
   
   private static final Logger log = LoggerFactory.getLogger(UserRentalController.class);   
   
   @RequestMapping(value = "/location.do")
   public String searchLocation(Model model) {
	   
      return "rental/location";
   }
   
   // 지역으로 검색한 구장리스트
   @RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
   public String searchPlaceList(@ModelAttribute PlaceVO pvo, Model model, RedirectAttributes redirectAttr, @RequestParam(value = "area", required = true, defaultValue = "null") String area) {
      
	   log.info("============="+area);
      
      List<PlaceVO> searchPlaceList = placeService.searchPlaceList(area);
      
      if(searchPlaceList.isEmpty()) {
         redirectAttr.addFlashAttribute("message", "[" + area + "]지역에는 등록된 구장이 없습니다.");
         return "redirect:/user/rental/location.do";
      }
      model.addAttribute("searchPlaceList", searchPlaceList);
         for(PlaceVO list : searchPlaceList) {
        	 log.info(list.toString());
         }
      return "rental/placeList";
   }
   
   // 대관 신청페이지
   @RequestMapping(value = "/rentalStadium.do", method = RequestMethod.POST)
   public String rentalInsert(@ModelAttribute PlaceVO pvo, Model model, @RequestParam(value = "p_num") String p_num) {
      pvo = placeService.selectPlace(p_num);
      
      System.out.println("=============" + pvo.toString());
      model.addAttribute("pvo", pvo);
      
      return "rental/rentalStadium";
   }
   
   }

