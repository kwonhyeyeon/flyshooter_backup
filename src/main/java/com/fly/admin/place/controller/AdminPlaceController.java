package com.fly.admin.place.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.admin.items.service.AdminItemsService;
import com.fly.admin.place.service.AdminPlaceService;
import com.fly.admin.stadium.service.AdminStadiumService;
import com.fly.client.items.vo.ItemsVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;
import com.fly.paging.util.Paging;
import com.fly.paging.util.Util;

@Controller
@RequestMapping(value = "/admin/place")
public class AdminPlaceController {
	
	@Resource(name = "adminPlaceService")
	private AdminPlaceService adminPlaceService;
	
	@Resource(name = "adminItemsService")
	private AdminItemsService adminItemsSerivce;
	
	@Resource(name = "adminStadiumService")
	private AdminStadiumService adminStadiumService;
	
	// 구장 관리 리스트(구장 상태, 구장명으로 검색)
	@RequestMapping(value = "/placeList.do", method = RequestMethod.GET)
	public String adminPlaceListChk(
			HttpServletRequest request,
			@ModelAttribute PlaceVO pvo,
			Model model
			) {
		
		Paging.setPage(pvo, 15);
		int total = adminPlaceService.adminPlaceListCnt(pvo);
		int count = total - (Util.nvl(pvo.getPage()) -1 ) * Util.nvl(pvo.getPageSize());
		System.out.println("adminPlaceList 호출 성공");
		
		// 폐업 -2, 임시휴업 -1, 운영전 0, 운영중 1, 전체 2
		// 구장명 검색		
		adminPlaceService.adminPlaceList(pvo);
		model.addAttribute("adminPlaceList", adminPlaceService.adminPlaceList(pvo));
		model.addAttribute("count", count);
	    model.addAttribute("total", total);
	    model.addAttribute("data", pvo);
		
		return "admin/place/placeList";
	}
	
	// 구장 정보 상세페이지
	@RequestMapping(value = "/placeDetail.do", method = RequestMethod.GET)
	public String adminPlaceDetailChk(
			HttpServletRequest request,
			@ModelAttribute PlaceVO pvo,
			@ModelAttribute ItemsVO ivo,
			@ModelAttribute StadiumVO svo,
			Model model
			) {
		
		System.out.println("adminPlaceDetailChk 호출 성공");
		
		String p_num = pvo.getP_num();
		
		pvo = adminPlaceService.adminPlaceDetail(p_num);
		model.addAttribute("pvo", pvo);
		
		// 용품 리스트 출력
		List<ItemsVO> itemsList = adminItemsSerivce.getItemsList(ivo);
		model.addAttribute("itemsList", itemsList);
		
		// 경기장 리스트 출력
		List<StadiumVO> stadiumList = adminStadiumService.getStadiumList(svo);
		model.addAttribute("s_no", svo.getS_no());
		model.addAttribute("stadiumList", stadiumList);
		
		// 대관 리스트 확인
		int rentalCnt = adminPlaceService.getRentalCnt(pvo.getP_num());
		model.addAttribute("rentalCnt", rentalCnt);
		
		return "admin/place/placeDetail";
	}
	
	// 구장 승인 상태 변경
	@RequestMapping(value = "/updatePok.do", method = RequestMethod.POST)
	public String updatePokChk(HttpServletRequest request, @ModelAttribute PlaceVO pvo, RedirectAttributes redirectAttr) {
		
		System.out.println("updatePokChk 호출 성공");
		
		adminPlaceService.updatePok(pvo);
		
		redirectAttr.addAttribute("p_num", pvo.getP_num());
		
		return "redirect:/admin/place/placeDetail.do";
		
	}
	
	// 폐업 등록
	@RequestMapping(value = "/updateClose.do", method = RequestMethod.POST)
	public String updateCloseChk(HttpServletRequest request, @ModelAttribute PlaceVO pvo, RedirectAttributes redirectAttr) {
		
		System.out.println("updateCloseChk 호출 성공");
		
		// 대관 리스트 확인
		int rentalCnt = adminPlaceService.getRentalCnt(pvo.getP_num());
		
		if(rentalCnt == 0) {
			
			adminPlaceService.updateClose(pvo);
			redirectAttr.addAttribute("p_num", pvo.getP_num());
			
			// 폐업 등록일 update
			adminPlaceService.getCloseDate(pvo.getP_num());
			redirectAttr.addAttribute("p_holiday_start", pvo.getP_holiday_start());
			
		} else {
			redirectAttr.addAttribute("p_num", pvo.getP_num());
			redirectAttr.addFlashAttribute("rentalCnt", rentalCnt);
		}
		
		return "redirect:/admin/place/placeDetail.do";
		
	}

}
