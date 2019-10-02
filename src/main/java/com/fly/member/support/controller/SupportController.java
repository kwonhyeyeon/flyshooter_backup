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

import com.fly.member.common.page.BoardPagingUtils;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.join.service.MemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.support.vo.SupportVO;
import com.fly.paging.util.PageUtils;
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
		
		String result = "";
		
		// 일자가 지났을 경우 진행상황 변경
		supportService.supportMbdate(svo);
		model.addAttribute("supportMbdate", svo);
		
		// 페이징 세팅
		BoardPagingUtils.setPage(svo);
		
		// 전체 레코드 수 구현하기
		int total = supportService.supportListCnt(svo);
		
		int count = total - (PageUtils.nvl(svo.getPage()) - 1) * PageUtils.nvl(svo.getPageSize());
		
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
		
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		model.addAttribute("member", memberService.memberSelect(m_id));
		
		return "support/supportInsertForm";
	}
	
	
	/***************************************************************
	 * 글 쓰기 등록 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/supportInsert.do")
	public String supportInsert_LoginChk(@ModelAttribute SupportVO svo, HttpServletRequest request) throws Exception {
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

		int result = 0;
		String url = "";
		result = supportService.supportUpdate(svo);

		if (result == 1) {
			url = "/support/supportList.do?hs_no=" + svo.getHs_no();
		} else {
			url = "/support/supportUpdateForm.do?hs_no=" + svo.getHs_no();
		}

		return "redirect:" + url;
	}
	
	
	
}
