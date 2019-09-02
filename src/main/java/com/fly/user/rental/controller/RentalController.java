package com.fly.user.rental.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.member.place.vo.PlaceVO;
import com.fly.user.place.service.PlaceService;

@Controller(value = "/user/rental")
public class RentalController {
   
   @Autowired
   private PlaceService placeService;
   
   private static final Logger logger = LoggerFactory.getLogger(RentalController.class);
   
   @RequestMapping(value = "/rental/location.do")
   public String searchLocation(Model model) {
      model.addAttribute("m_id", "aaa@naver.com");
      model.addAttribute("m_type", 1);
	   
      return "rental/location";
   }
   
   // 지역으로 검색한 구장리스트
   @RequestMapping(value = "/rental/placeList.do", method = RequestMethod.GET)
   public String searchPlaceList(@ModelAttribute PlaceVO pvo, Model model, RedirectAttributes redirectAttr, @RequestParam(value = "area", required = true, defaultValue = "null") String area) {
      
      logger.info("============="+area);
      
      List<PlaceVO> suchPlaceList = placeService.searchPlaceList(area);
      List<PlaceVO> searchPlaceList = placeService.searchPlaceList(area);
      
      if(searchPlaceList.isEmpty()) {
         redirectAttr.addFlashAttribute("message", "[" + area + "]지역에는 등록된 구장이 없습니다.");
         return "redirect:/rental/location.do";
      }
      model.addAttribute("searchPlaceList", searchPlaceList);
         for(PlaceVO list : searchPlaceList) {
            logger.info(list.toString());
         }
      return "rental/placeList";
   }
   
   // 대관 신청페이지
   @RequestMapping(value = "/rental/rentalStadium.do", method = RequestMethod.POST)
   public String rentalInsert(@ModelAttribute PlaceVO pvo, Model model) {
      logger.info("여기옴 ?? ==============" + pvo.getP_num());
      logger.info("==============" + pvo.toString());
      model.addAttribute("p_num", pvo.getP_num());
      return "rental/rentalStadium";
   }
   }