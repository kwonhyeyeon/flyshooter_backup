package com.fly.admin.support.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.admin.support.service.AdminSupportService;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.support.vo.SupportVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminSupportController {
	
	@Autowired
	private AdminSupportService adminSupportService;
	
	
	/***************************************************************
	 * 글 목록 구현하기
	 ***************************************************************/
	
	@RequestMapping(value = "/support/supportList.do", method = RequestMethod.GET)
	public String supportList(@ModelAttribute SupportVO svo, CommonVO cvo, Model  model) {
		System.out.println("admin supportList 호출 성공");
		
		// 전체 레코드 수 구현 하기
		System.out.println(svo.getKeyword());
		int total = adminSupportService.adminSupportListCnt(svo);
		System.out.println("total : " + total);
		
		List<SupportVO> adminSupportList = adminSupportService.adminSupportList(svo);
		
		model.addAttribute("adminSupportList", adminSupportList);
		model.addAttribute("total", total);
		model.addAttribute("data", svo);
		
		return "admin/support/supportList";
	}

	/***************************************************************
	 * 글 상세보기 구현
	 *************************************************************/

	@RequestMapping(value = "/support/supportView.do", method = RequestMethod.GET)
	public String supportView(@ModelAttribute SupportVO svo, Model model) throws Exception {
		System.out.println("admin supportview 호출 성공");
		
		String result = "";
		
		SupportVO supportview = new SupportVO();
		supportview = adminSupportService.supportView(svo);

		model.addAttribute("supportView", supportview);

		return "admin/support/supportView";
	}
	
	/***************************************************************
	 * 글 삭제 구현
	 *************************************************************/
	@RequestMapping(value = "/support/supportDelete.do", method = RequestMethod.GET)
	public String supportStatusUpdate(@ModelAttribute SupportVO svo, Model model) throws Exception {
		System.out.println("admin supportDelete 호출 성공");
		int result = 0;
		String url = "";
		result = adminSupportService.supportStatusUpdate(svo);
		
		if (result == 1) {
			url = "/admin/support/supportList.do";
		} else {
			url = "/admin/support/supportView.do";
		}
		
		return "redirect:" + url;
	}
}
