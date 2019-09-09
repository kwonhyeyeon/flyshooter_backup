package com.fly.client.rental.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.place.vo.PlaceVO;
import com.fly.member.itemsrental.vo.ItemsRentalVO;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.rental.vo.RentalVO;
import com.fly.member.stadium.vo.StadiumVO;

@Controller
@RequestMapping(value = "/client/rental")
public class ClientRentalController {

	@Resource(name = "clientPlaceService")
	private ClientPlaceService clientPlaceService;
	
	// 구장 별 경기장 별 대관 예약 현황(첫 로드)
	@RequestMapping(value = "/rentalList.do", method = RequestMethod.GET)
	public ModelAndView rentalListByStadiumByPlace(
			@ModelAttribute PlaceVO pvo,
			@RequestParam(value = "m_id", required = true, defaultValue = "aaa@naver.com") String m_id,
			@RequestParam(value = "r_reserve_date", required=false) String r_reserve_date) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("구장 별 경기장 별 대관 예약 현황 호출");
		System.out.println(m_id);
		
		// 구장 리스트 출력
		List<PlaceVO> placeList = clientPlaceService.placeList(m_id);
		
		if(placeList.isEmpty()) { // 구장이 없을 때
			mav.addObject("placeList", placeList);
			mav.setViewName("rental/rentalList");
			return mav;
		} else {
			mav.addObject("placeList", placeList);
			mav.setViewName("rental/rentalList");
			
			for(PlaceVO place : placeList) {
				System.out.println("구장 리스트");
			   	System.out.println(placeList);
			   	System.out.println(place.toString());
			}
		}
		
		// 경기장 리스트 출력
		String p_num = placeList.get(0).getP_num();
		
		List<StadiumVO> stadiumList = clientPlaceService.stadiumList(p_num);
		if(stadiumList.isEmpty()) {
			System.out.println(stadiumList);
			mav.addObject("stadiumList", stadiumList);
			mav.setViewName("rental/rentalList");
			
			return mav;
		} else {
			mav.addObject("stadiumList", stadiumList);
			mav.setViewName("rental/rentalList");
			for(StadiumVO stadium : stadiumList) {
				System.out.println("경기장 리스트");
				System.out.println(stadiumList);
			   	System.out.println(stadium.toString());
			}
		}
		
//		// 경기장 별 대관 예약 리스트
//		int s_no = stadiumList.get(0).getS_no();
//		MemberVO member = new MemberVO();
//		
//		List<RentalVO> rentalList = clientPlaceService.rentalList(s_no, r_reserve_date);
//		System.out.println(s_no);
//		System.out.println(r_reserve_date);
//		mav.addObject("m_name", member.getM_name());
//		mav.addObject("m_phone", member.getM_phone());
//		mav.addObject("rentalList", rentalList);
//		mav.setViewName("rental/rentalList");
//		for(RentalVO rental : rentalList) {
//			System.out.println("대관 현황 리스트");
//			System.out.println(rentalList);
//			System.out.println(rental.toString());
//		}

		return mav;
	}
	
    // 구장 별 경기장 별 대관 예약 현황(선택 값이 변경될 때)
    @RequestMapping(value = "/rentalList.do", 
                    method = RequestMethod.POST,
                    produces= "text/html; charset=UTF-8")
    @ResponseBody
    public String rentalListByStadiumByPlace(
            @ModelAttribute StadiumVO svo,
            @ModelAttribute RentalVO rvo,
            @RequestParam(value = "p_num", required = true, defaultValue = "x") String p_num,
            @RequestParam(value = "s_no", required = true, defaultValue = "1") int s_no) {
        
        System.out.println("구장 별 경기장 별 대관 예약 현황 호출");
        
        String result = "";
        
        // 구장의 경기장 리스트
        List<StadiumVO> stadiumList = clientPlaceService.stadiumList(p_num);
        
        for(StadiumVO stadium : stadiumList) {
            System.out.println("경기장 리스트");
               System.out.println(stadium.toString());
        }
        
        // 경기장명 출력
        if(stadiumList.isEmpty()) { // 경기장 리스트가 없을 경우
            result = "<p class='noStadium'>경기장이 없습니다. 경기장을 등록해주세요</p>";
        } else { // 경기장 리스트가 있을 경우
            for(StadiumVO stadium : stadiumList) {
                result += "<h2 class='stadiumName'>" + stadium.getS_name() + "</h2>";
                
                // 경기장 별 대관 예약 리스트
                String r_reserve_date = "2019-09-05";
                List<RentalVO> rentalList = clientPlaceService.rentalList(s_no, r_reserve_date);
                for(RentalVO rental : rentalList) {
                    System.out.println("대관 현황 리스트");
                    System.out.println(rental.toString());
                }
                
            }
        }
    
        
        return result;
    }
}
