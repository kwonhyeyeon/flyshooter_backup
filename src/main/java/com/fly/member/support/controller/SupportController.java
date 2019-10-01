package com.fly.member.support.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.common.util.Util;
import com.fly.member.common.page.BoardPagingUtils;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.join.service.MemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.support.vo.SupportVO;
import com.fly.member.support.service.SupportService;

@Controller
@RequestMapping(value = "/support")
public class SupportController {
	@Autowired
	private SupportService supportService;
	
	@Autowired
	private MemberService memberService;
	
	/***************************************************************
	 * 글 목록 구현하기
	 ***************************************************************/
	
	@RequestMapping(value = "/supportList.do", method = RequestMethod.GET)
	public String supportList(@ModelAttribute SupportVO svo, CommonVO cvo, Model model) {
		System.out.println("supportList 호출 성공");
		
		String result = "";
		
		// 일자가 지났을 경우 진행상황 변경
		supportService.supportMbdate(svo);
		model.addAttribute("supportMbdate", svo);
		
		// 페이징 세팅
		BoardPagingUtils.setPage(svo);
		
		// 전체 레코드 수 구현하기
		System.out.println(svo.getKeyword());
		int total = supportService.supportListCnt(svo);
		
		System.out.println(total);
		
		int count = total - (Util.nvl(svo.getPage()) - 1) * Util.nvl(svo.getPageSize());
		
		List<SupportVO> supportList = supportService.supportList(svo);
		model.addAttribute("supportList", supportList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", svo);
		
		return "support/supportList";
	}
	
	/***************************************************************
	 * 글 상세보기 구현
	 *************************************************************/
	
	@RequestMapping(value = "/supportView.do", method = RequestMethod.GET)
	public String supportView(@ModelAttribute SupportVO svo, Model model) throws Exception {
		System.out.println("supportView 호출 성공");
		SupportVO supportview = new SupportVO();
		supportview = supportService.supportView(svo);
		
		model.addAttribute("supportView", supportview);
		
		return "support/supportView";
	}

	/***************************************************************
	 * 글 쓰기 폼 출력하기
	 *************************************************************/

	@RequestMapping(value = "/supportInsertForm.do", method = RequestMethod.GET)
	public String supportInsertForm_LoginChk(@ModelAttribute MemberVO mvo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("supportInsertForm 호출 성공");
		
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		System.out.println(m_id);
	
		model.addAttribute("member", memberService.memberSelect(m_id));
		
		return "support/supportInsertForm";
	}
	
	
	/***************************************************************
	 * 글 쓰기 등록 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/supportInsert.do")
	public String supportInsert_LoginChk(@ModelAttribute SupportVO svo, HttpServletRequest request) throws Exception {
		System.out.println("supportInsert 호출 성공");
		int result = 0;
		String url = "";
		result = supportService.supportInsert(svo);

		if (result == 1) {
			url = "/support/supportList.do";
		} else {
			url = "/support/supportInsertForm.do";
		}
		return "redirect:" + url;
	}

	/***************************************************************
	 * 글 수정 폼 출력하기
	 ***************************************************************/

	@RequestMapping(value = "/supportUpdateForm.do")
	public String supportUpdateForm_LoginChk(@ModelAttribute SupportVO svo, Model model, HttpServletRequest request) throws Exception {
		System.out.println("supportUpdateForm 호출 성공");

		SupportVO updateSupportData = new SupportVO();
		updateSupportData = supportService.supportView(svo);
		
		model.addAttribute("updateSupportData", updateSupportData);
		return "support/supportUpdateForm";
	}

	/***************************************************************
	 * 글 수정 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/supportUpdate.do", method = RequestMethod.POST)
	public String supportUpdate_LoginChk(@ModelAttribute SupportVO svo, HttpServletRequest request) throws Exception {

		System.out.println("supportUpdate 호출 성공");

		int result = 0;
		String url = "";
		System.out.println(svo.getHs_no());
		result = supportService.supportUpdate(svo);

		if (result == 1) {
			url = "/support/supportList.do?hs_no=" + svo.getHs_no();
		} else {
			url = "/support/supportUpdateForm.do?hs_no=" + svo.getHs_no();
		}

		return "redirect:" + url;
	}
	
	
	
}
