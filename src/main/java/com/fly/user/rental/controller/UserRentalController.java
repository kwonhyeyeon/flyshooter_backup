package com.fly.user.rental.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.client.items.service.ItemsService;
import com.fly.client.items.vo.ItemsVO;
import com.fly.member.itemsrental.service.ItemsRentalService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;
import com.fly.paging.util.Paging;
import com.fly.paging.util.Util;
import com.fly.rental.detail.vo.RentalDetailVO;
import com.fly.user.place.service.UserPlaceService;
import com.fly.user.rental.service.UserRentalService;
import com.fly.user.stadium.service.UserStadiumService;

@Controller
@RequestMapping(value = "/user/rental")
public class UserRentalController {
	
	@Resource(name="userPlaceService")
    private UserPlaceService placeService;
	@Resource(name = "userStadiumService")
	private UserStadiumService userStadiumService;
	@Resource(name = "userRentalService")
	private UserRentalService userRentalService;
	@Resource(name = "itemsService")
	private ItemsService itemsService;
	@Resource(name = "itemsRentalService")
	private ItemsRentalService itemsRentalService;
   
	private static final Logger log = LoggerFactory.getLogger(UserRentalController.class);   
   
    @RequestMapping(value = "/location.do")
    public String searchLocation_UserChk(Model model,HttpServletRequest request) {
	    
       return "rental/location";
    }
   
   // 지역으로 검색한 구장리스트
   @RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
   public String searchPlaceList_UserChk(@ModelAttribute PlaceVO pvo,HttpServletRequest request, Model model,
		   RedirectAttributes redirectAttr, 
		   @RequestParam(value = "area", required = true, defaultValue = "null") String area) {
      
	   log.info("============="+area);
      
      List<PlaceVO> searchPlaceList = placeService.searchPlaceList(area);
      if(searchPlaceList.isEmpty()) {
         redirectAttr.addFlashAttribute("message", "[" + area + "]지역에는 등록된 구장이 없습니다.");
         return "redirect:/user/rental/location.do";
      }
      model.addAttribute("searchPlaceList", searchPlaceList);
      return "rental/rentalPlaceList";
   }
   
   // 대관 신청페이지
   @RequestMapping(value = "/rentalStadium.do", method = RequestMethod.POST)
   public String rentalInfo_UserChk(@ModelAttribute PlaceVO pvo, Model model,
		   @RequestParam(value = "p_num") String p_num, 
		   @RequestParam(value = "area", required = true, defaultValue = "null") String area, 
		   RedirectAttributes redirectAttr, HttpServletRequest request) {

      pvo = placeService.selectPlace(p_num);
      List<StadiumVO> stadiumList = userStadiumService.selectStadiumList(p_num);
      List<ItemsVO> itemsList = itemsService.searchItemsList(p_num);
      model.addAttribute("pvo", pvo);
      model.addAttribute("stadiumList", stadiumList);
      model.addAttribute("itemsList", itemsList);
      
      
      return "rental/rentalStadium";
   }
   
   // 대관일, 경기장일련번호로 예약가능한 시간을 비동기로 조회하는 메소드
   @RequestMapping(value = "/searchTime.do", method = RequestMethod.POST, produces= "text/html; charset=UTF-8")
   @ResponseBody
   public String searchTime(@ModelAttribute StadiumVO svo,
		   @RequestParam(value = "selectDay") String selectDay){
	   
	   String result = "";
	   
	  List<String> impossibleTime = userRentalService.searchReservationTime(selectDay, svo.getS_no());

	  int start = Integer.parseInt(svo.getP_open()); // 구장의 영업시작시간
	  int end = Integer.parseInt(svo.getP_close()); // 종료시간
	  int increase = svo.getS_hours(); // 최소 이용가능시간
	   
	  for(int i = start; i+increase <= end; i+=increase) {
		  result += "<label><input type='radio' name='reservationTime' value='"+i+","+(i+increase)+"'";
		 
			  if(impossibleTime.contains(i+"")) {
				  result += " style='display:none' /></label>";
			  }else {
			  result += "/>"+i+" ~ "+ (i + increase) + "(시)</label>";
		  }
	  }
	   return result;
   }
   
   
   // 대관일, 경기장일련번호로 예약가능한 시간을 비동기로 조회하는 메소드
   @RequestMapping(value = "/stadiumImg.do", method = RequestMethod.POST, produces= "text/html; charset=UTF-8")
   @ResponseBody
   public String searchTime(@RequestParam(value = "s_no") int s_no){
	   StringBuffer result = new StringBuffer();
	   
	   StadiumVO svo = userRentalService.selectStadiumImg(s_no);

	   try {
		   svo.toString();
	   }catch(NullPointerException e) {
		   result.append("Empty");
		   return result.toString();
	   }
	   
	   result.append(" <li><input type='radio' id='slide1' name='slide' checked><label for='slide1'></label><img src='/resources/img/default_img.jpg' alt='Panel 1'></li>");
	   
	   
	   if(  !(svo.getS_img1() == null)  ) {
		   result.append("<li><input type='radio' id='slide2' name='slide'><label for='slide2'></label><img src='/uploadStorage/image1/");
		   result.append(svo.getS_img1());
		   result.append("' alt='Panel 2'></li>");
	   }
			   
	   if(  !(svo.getS_img2() == null)  ) {
		   result.append("<li><input type='radio' id='slide3' name='slide'><label for='slide3'></label><img src='/uploadStorage/image2/");
		   result.append(svo.getS_img2());
		   result.append("' alt='Panel 3'></li>");
	   }
	   
	   if( !(svo.getS_img3() == null) ) {
		   result.append("<li><input type='radio' id='slide4' name='slide'><label for='slide4'></label><img src='/uploadStorage/image3/");
		   result.append(svo.getS_img3());
		   result.append("' alt='Panel 4'></li>");
	   }
	   
	   return result.toString();
   }
   
   // 대관일, 경기장일련번호로 예약가능한 시간을 비동기로 조회하는 메소드
   @RequestMapping(value = "/reservationCheck.do", method = RequestMethod.POST, produces= "text/html; charset=UTF-8")
   @ResponseBody
   public String reservationCheck(@RequestParam(value = "overlapKey") String overlapKey, HttpSession session){
	  
	   
	   String overlap = (String)session.getAttribute("overlap");
	  try {
		  // session에 저장된 값이 없으면 오류를 낸다.
		  overlap.length();
		  
		  
		  if(overlapKey.equals(overlap)) {
			  return "true";
		  }else {
			  // over_key로 delete
			  userRentalService.deleteReservation(overlap);
			  
			  // 해당 overlap값 DB에서 삭제후 catch로 보낸다.
			  String nullPointer = null;
			  nullPointer.toString();
		  }
		  
	  }catch(NullPointerException e) {
		  userRentalService.deleteReservation("null");
		   try {
		   userRentalService.reservationCheck(overlapKey);
		   }catch(Exception ex) {
			   return "false";
		   }
		   session.setAttribute("overlap", overlapKey);
		   return "true";
	   	}
	  
	  
	  return "시스템 오류\n관리자한테 문의하십시오";
	  }
   
   // 예약취소시 세션에 저장되어 있는 overlap을 불러와 데이터 삭제.
   @RequestMapping(value = "/removeReservation.do", method = RequestMethod.POST, produces= "text/html; charset=UTF-8")
   @ResponseBody
   public String removeReservation_LoginChk(HttpSession session,HttpServletRequest request){
	   String result = "삭제상공";
	   String overlap = (String)session.getAttribute("overlap");
	   userRentalService.deleteReservation(overlap);
	   session.removeAttribute("overlap");
	   	return result;
	  }
   
   // 예약이 완료되어 예약정보를 DB에 insert한다.
   @RequestMapping(value = "/insertRental.do", method = RequestMethod.POST)
   public String insertRental_LoginChk(@ModelAttribute RentalVO rvo, Model model, 
		   @RequestParam(value = "items_no", required = true, defaultValue = "null") String items_no, 
		   @RequestParam(value = "items_ea", required = true, defaultValue = "null") String items_ea, 
		   HttpSession session, HttpServletRequest request) {
	   int result = 0;

	   MemberVO mvo = (MemberVO) session.getAttribute("mvo");
	   rvo.setM_id(mvo.getM_id());
	   try {
	   // 대관정보 (retnal) insert
	   result = userRentalService.insertRental(rvo, items_no, items_ea);
	   }catch(Exception e) {
		   e.toString();
		   e.printStackTrace();
		   System.out.println("대관실패.. 관리자한테 문의하십시오");
	   }
	   System.out.println(result);
	   return "rental/location";
   }
   
   @RequestMapping(value = "/myRentalList.do", method = RequestMethod.GET)
   public String myRentalList_LoginChk(@ModelAttribute RentalVO rvo, Model model, HttpSession session,
		   HttpServletRequest request) {
	  
	   Paging.setPage(rvo, 5);
	   
	   MemberVO mvo = (MemberVO) session.getAttribute("mvo");
	   rvo.setM_id(mvo.getM_id());
	   
	   int total = userRentalService.myRentalListCnt(rvo.getM_id());
	   int count = total - (Util.nvl(rvo.getPage()) -1 ) * Util.nvl(rvo.getPageSize());
	   model.addAttribute("myList", userRentalService.selectMyRentalList(rvo));
	   model.addAttribute("count", count);
	   model.addAttribute("total", total);
	   model.addAttribute("data", rvo);
	   
	   return "rental/myRentalList";
   }
   
   
   @RequestMapping(value = "/rentalDetail.do", method = RequestMethod.POST)
   public String rentalDetail_LoginChk(Model model, @RequestParam("r_no") int r_no, 
		   @RequestParam("page") String page, HttpServletRequest request) {
	   
	   model.addAttribute("data", userRentalService.showDetail(r_no));
	   model.addAttribute("page", page);
	   model.addAttribute("itemsList", itemsRentalService.getItemsRentalList(r_no));
	   
	   return "rental/rentalDetail";
   }
   
   @RequestMapping(value = "/rentalUpdate.do", method = RequestMethod.POST)
   public String rentalUpdate_LoginChk(@ModelAttribute RentalVO rvo, Model model, 
		   RedirectAttributes redirectAttr, HttpServletRequest request) {
	   redirectAttr.addAttribute("page", rvo.getPage());
	  int result = userRentalService.rentalUpdate(rvo);
	   String massage = "";
	   
	   
	   if(result == 1) {
		   massage = "환불처리가 성공적으로 이루어졌습니다.";
	   }
	   else if(result == 0) {
		   massage = "환불처리에 실패하였습니다.\n다시 시도해주십시오";
	   }
	   redirectAttr.addFlashAttribute("massage", massage);
	   
	   return "redirect:/user/rental/myRentalList.do";
	   
   }
   }

