package com.fly.client.calculate.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.client.calculate.service.ClientCalculateService;
import com.fly.client.calculate.vo.CalculateVO;
import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.rental.service.ClientRentalService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.paging.util.Paging;
import com.fly.paging.util.PageUtils;

@Controller
@RequestMapping(value = "/mypage")
public class ClientCalculateController {

	@Resource(name = "calculateService")
	private ClientCalculateService calculateService;

	@Resource(name = "clientRentalService")
	private ClientRentalService clientRentalService;

	// 정산 리스트 구현하기
	@RequestMapping(value = "/calculate.do", method = RequestMethod.GET)
	public String calculate_ClientChk(Model model, HttpSession session, @ModelAttribute CalculateVO cvo,
			HttpServletRequest request) {
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		cvo.setM_id(m_id);
		// 페이지 세팅
		Paging.setPage(cvo, 15);
		// 전체 레코드수
		int total = calculateService.pageingSize(cvo);
		// 글번호 재설정
		int count = total - (PageUtils.nvl(cvo.getPage()) - 1) * PageUtils.nvl(cvo.getPageSize());
		
		List<CalculateVO> calculateIList = calculateService.calculateIList(cvo);
		List<CalculateVO> calculateList = calculateService.calculateList(cvo);
		
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", cvo);
		model.addAttribute("calculateIList", calculateIList);
		model.addAttribute("calculateList", calculateList);
		return "mypage/calculate";
	}

	// 정산 신청 구현하기
	@RequestMapping(value = "/calculateInsert.do", method = RequestMethod.POST)
	public String calculateInsert_ClientChk(Model model, @ModelAttribute CalculateVO cvo, HttpServletRequest request) {
		int result = calculateService.calculateInsert(cvo);
		if (result != 1) {
			model.addAttribute("errCode", 1);
		}
		return "redirect:/mypage/calculate.do";
	}
}
