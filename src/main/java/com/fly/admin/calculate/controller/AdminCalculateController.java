package com.fly.admin.calculate.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.admin.calculate.service.AdminCalculateService;
import com.fly.client.calculate.vo.CalculateVO;
import com.fly.paging.util.Paging;
import com.fly.paging.util.PageUtils;

@Controller
@RequestMapping(value = "/admin/place")
public class AdminCalculateController {

	@Resource(name = "adminCalculateService")
	private AdminCalculateService adminCalculateService;

	// 관리자 정산 목록 구현하기
	@RequestMapping(value = "/adminCalculateList.do", method = RequestMethod.GET)
	public String adminCalculateFormChk(Model model, @ModelAttribute CalculateVO cvo, HttpServletRequest request) {
		System.out.println("adminCalculateList 호출 성공");
		// 페이지 세팅
		Paging.setPage(cvo, 15);
		// 전체 레코드수
		int total = adminCalculateService.pageingSize(cvo);
		// 글번호 재설정
		int count = total - (PageUtils.nvl(cvo.getPage()) - 1) * PageUtils.nvl(cvo.getPageSize());
		List<CalculateVO> list = adminCalculateService.adminCalculateList(cvo);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", cvo);
		model.addAttribute("calculateList", list);

		return "/admin/place/adminCalculate";
	}

	// 관리자 정산 구현하기
	@RequestMapping(value = "/adminCalculateUpdate.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String adminCalculateUpdateChk(Model model, @ModelAttribute CalculateVO cvo,  HttpServletRequest request) {
		System.out.println("cal_update 호출 성공");
		String result = "0";
		try {
			int result1 = adminCalculateService.adminCalculateUpdate(cvo);
			int result2 = adminCalculateService.adminCRentalUpdate(cvo.getP_num());
			result = "1";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = "-1";
		}

		return result;
	}
}
