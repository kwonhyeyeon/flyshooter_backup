package com.fly.user.rental.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
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

import com.fly.member.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;
import com.fly.user.place.service.UserPlaceService;
import com.fly.user.stadium.service.UserStadiumService;

@Controller
@RequestMapping(value = "/user/rental")
public class UserRentalController {

	@Resource(name = "userPlaceService")
	private UserPlaceService placeService;
	@Resource(name = "userStadiumService")
	private UserStadiumService userStadiumService;
	/*
	 * @Resource(name = "userRentalService") private UserRentalService
	 * userRentalService;
	 */

	private static final Logger log = LoggerFactory.getLogger(UserRentalController.class);

	@RequestMapping(value = "/location.do")
	public String searchLocation(Model model) {

		return "rental/location";
	}

	// 지역으로 검색한 구장리스트
	@RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
	public String searchPlaceList(@ModelAttribute PlaceVO pvo, Model model, RedirectAttributes redirectAttr,
			@RequestParam(value = "area", required = true, defaultValue = "null") String area) {

		log.info("=============" + area);

		List<PlaceVO> searchPlaceList = placeService.searchPlaceList(area);
		if (searchPlaceList.isEmpty()) {
			redirectAttr.addFlashAttribute("message", "[" + area + "]지역에는 등록된 구장이 없습니다.");
			return "redirect:/user/rental/location.do";
		}
		model.addAttribute("searchPlaceList", searchPlaceList);
		for (PlaceVO list : searchPlaceList) {
			log.info(list.toString());
		}
		return "rental/rentalPlaceList";
	}

	// 대관 신청페이지
	@RequestMapping(value = "/rentalStadium.do", method = RequestMethod.POST)
	public String rentalInfo(@ModelAttribute PlaceVO pvo, @ModelAttribute StadiumVO svo, Model model,
			@RequestParam(value = "p_num") String p_num,
			@RequestParam(value = "area", required = true, defaultValue = "null") String area,
			RedirectAttributes redirectAttr) {

		pvo = placeService.selectPlace(p_num);
		List<StadiumVO> stadiumList = userStadiumService.selectStadiumList(p_num);

		// log
		System.out.println(pvo.toString());
		for (StadiumVO svo2 : stadiumList) {
			System.out.println(svo2.toString());
		}
		System.out.println(stadiumList.size());
		// end

		model.addAttribute("pvo", pvo);
		model.addAttribute("stadiumList", stadiumList);

		return "rental/rentalStadium";
	}

	/*
	 * // 대관일, 경기장일련번호로 예약가능한 시간을 비동기로 조회하는 메소드
	 * 
	 * @RequestMapping(value = "/searchTime.do", method = RequestMethod.POST,
	 * produces= "text/html; charset=UTF-8")
	 * 
	 * @ResponseBody public String searchTime(@ModelAttribute StadiumVO svo,
	 * 
	 * @RequestParam(value = "selectDay") String selectDay){
	 * 
	 * String result = "";
	 * 
	 * // List<String> impossibleTime =
	 * userRentalService.searchReservationTime(selectDay, svo.getS_no());
	 * 
	 * int start = Integer.parseInt(svo.getP_open()); int end =
	 * Integer.parseInt(svo.getP_close()); int increase = svo.getS_hours();
	 * 
	 * for(int i = start; i+increase <= end; i+=increase) { result +=
	 * "<label><input type='radio' name='reservationTime' value='"+i+","+(i+increase
	 * )+"'";
	 * 
	 * if(impossibleTime.contains(i+"")) { result +=
	 * " style='display:none' /></label>"; }else { result += "/>"+i+" ~ "+ (i +
	 * increase) + "(시)</label>"; } } result +=
	 * "<div id='geRental' style='display:none'>"; result +=
	 * "<p id='payment'></p><span> 원</span>"; result +=
	 * "<button id='goRentalBtn'>결제</button>"; result += "</div>"; return result; }
	 */

	// 대관일, 경기장일련번호로 예약가능한 시간을 비동기로 조회하는 메소드
	@RequestMapping(value = "/reservationCheck.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String reservationCheck(@RequestParam(value = "overlapKey") String overlapKey, HttpSession session) {

		String overlap = (String) session.getAttribute("overlap");
		try {
			// session에 저장된 값이 없으면 오류를 낸다.
			overlap.length();

			if (overlapKey.equals(overlap)) {
				return "true";
			} else {
				// over_key로 delete
				// userRentalService.deleteReservation(overlap);

				// 해당 overlap값 DB에서 삭제후 catch로 보낸다.
				String nullPointer = null;
				nullPointer.toString();
			}

		} catch (NullPointerException e) {
			System.out.println("null 오류");
			// userRentalService.deleteReservation("null");
			try {
				// userRentalService.reservationCheck(overlapKey);
			} catch (Exception ex) {
				return "해당 시간은 현재 예약이 진행중입니다.";
			}
			session.setAttribute("overlap", overlapKey);
			return "true";
		}

		return "시스템 오류\n관리자한테 문의하십시오";
	}

// 대관일, 경기장일련번호로 예약가능한 시간을 비동기로 조회하는 메소드
	@RequestMapping(value = "/setdialog.do", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String setDialog(@RequestParam(value = "param") String param) {
		String result = "";
		result += "<label><input type='radio' name='raido2' value='1' /> 1 ";
		result += "<label><input type='radio' name='raido2' value='2' /> 2 ";
		if ("1".equals(param)) {
			result += "<p>이거 나오냐 시팡</p>";
		} else {
			result += "<p>ㅋㅋㅋㅋ</p>";
		}
		return result;
	}

}
