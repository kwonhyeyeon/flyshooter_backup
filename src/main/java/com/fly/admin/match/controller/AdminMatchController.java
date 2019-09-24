package com.fly.admin.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fly.admin.match.service.AdminMatchService;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.match.vo.MatchVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminMatchController {
	@Autowired
	private AdminMatchService adminMatchService;
	
	/***************************************************************
	 * 글 목록 구현하기
	 ***************************************************************/
	
	@RequestMapping(value = "/match/matchList.do", method = RequestMethod.GET)
	public String matchListChk(@ModelAttribute MatchVO mavo, CommonVO cvo, Model model, HttpServletRequest request) {
		System.out.println("admin matchList 호출 성공");
		
		// 전체 레코드 수 구현 하기
		System.out.println(mavo.getKeyword());
		int total = adminMatchService.adminMatchListCnt(mavo);
		System.out.println("total : " + total);
		
		List<MatchVO> adminMatchList = adminMatchService.adminMatchList(mavo);
		
		model.addAttribute("adminMatchList", adminMatchList);
		model.addAttribute("total", total);
		model.addAttribute("data", mavo);
		
		return "admin/match/matchList";
	}

	/***************************************************************
	 * 글 상세보기 구현
	 *************************************************************/

	@RequestMapping(value = "/match/matchView.do", method = RequestMethod.GET)
	public String matchViewChk(@ModelAttribute MatchVO mavo, Model model, HttpServletRequest request) throws Exception {
		System.out.println("admin matchview 호출 성공");
		
		String result = "";
		
		MatchVO matchview = new MatchVO();
		matchview = adminMatchService.matchView(mavo);

		model.addAttribute("matchView", matchview);

		return "admin/match/matchView";
	}
	
	/***************************************************************
	 * 글 삭제 구현
	 *************************************************************/
	@RequestMapping(value = "/match/matchDelete.do", method = RequestMethod.GET)
	public String matchStatusUpdateChk(@ModelAttribute MatchVO mavo, Model model, HttpServletRequest request) throws Exception {
		System.out.println("admin matchDelete 호출 성공");
		int result = 0;
		String url = "";
		result = adminMatchService.matchStatusUpdate(mavo);
		
		if (result == 1) {
			url = "/admin/match/matchList.do";
		} else {
			url = "/admin/match/matchView.do";
		}
		
		return "redirect:" + url;
	}

}
