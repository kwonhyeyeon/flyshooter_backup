package com.fly.admin.recruit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.admin.recruit.service.AdminRecruitService;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.recruit.vo.RecruitVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminRecruitController {
	@Autowired
	private AdminRecruitService adminRecruitService;
	
	/***************************************************************
	 * 글 목록 구현하기
	 ***************************************************************/
	
	@RequestMapping(value = "/recruit/recruitList.do", method = RequestMethod.GET)
	public String recruitListChk(@ModelAttribute RecruitVO revo, CommonVO cvo, Model  model, HttpServletRequest request) {
		System.out.println("admin recruitList 호출 성공");
		
		// 전체 레코드 수 구현 하기
		System.out.println(revo.getKeyword());
		int total = adminRecruitService.adminRecruitListCnt(revo);
		System.out.println("total : " + total);
		
		List<RecruitVO> adminRecruitList = adminRecruitService.adminRecruitList(revo);
		
		model.addAttribute("adminRecruitList", adminRecruitList);
		model.addAttribute("total", total);
		model.addAttribute("data", revo);
		
		return "admin/recruit/recruitList";
	}

	/***************************************************************
	 * 글 상세보기 구현
	 *************************************************************/

	@RequestMapping(value = "/recruit/recruitView.do", method = RequestMethod.GET)
	public String recruitViewChk(@ModelAttribute RecruitVO revo, Model model, HttpServletRequest request) throws Exception {
		System.out.println("admin recruitview 호출 성공");
		
		String result = "";
		
		RecruitVO recruitview = new RecruitVO();
		recruitview = adminRecruitService.recruitView(revo);

		model.addAttribute("recruitView", recruitview);

		return "admin/recruit/recruitView";
	}
	
	/***************************************************************
	 * 글 삭제 구현
	 *************************************************************/
	@RequestMapping(value = "/recruit/recruitDelete.do", method = RequestMethod.GET)
	public String recruitStatusUpdateChk(@ModelAttribute RecruitVO revo, Model model, HttpServletRequest request) throws Exception {
		System.out.println("admin recruitDelete 호출 성공");
		int result = 0;
		String url = "";
		result = adminRecruitService.recruitStatusUpdate(revo);
		
		if (result == 1) {
			url = "/admin/recruit/recruitList.do";
		} else {
			url = "/admin/recruit/recruitView.do";
		}
		
		return "redirect:" + url;
	}

	
}
