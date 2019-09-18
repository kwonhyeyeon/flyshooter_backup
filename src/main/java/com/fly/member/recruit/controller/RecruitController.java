package com.fly.member.recruit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fly.common.util.Util;
import com.fly.member.common.page.Paging;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.join.service.MemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.recruit.service.RecruitService;
import com.fly.member.recruit.vo.RecruitVO;

@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
	@Autowired
	private RecruitService recruitService;
	
	@Autowired
	private MemberService memberService;
	
	/***************************************************************
	 * 글 목록 구현하기
	 ***************************************************************/
	
	@RequestMapping(value = "/recruitList.do", method = RequestMethod.GET)
	public String recruitList(@ModelAttribute RecruitVO revo, CommonVO cvo, Model model) {
		System.out.println("recruitList 호출 성공");
		
		// 일자가 지났을 경우 진행상황 변경
		recruitService.recruitMbdate(revo);
		model.addAttribute("recruitMbdate", revo);
		
		// 페이징 세팅
		Paging.setPage(revo);
		
		// 전체 레코드 수 구현하기
		System.out.println(revo.getKeyword());
		int total = recruitService.recruitListCnt(revo);
		
		System.out.println(total);
		
		int count = total - (Util.nvl(revo.getPage()) - 1) * Util.nvl(revo.getPageSize());
		
		List<RecruitVO> recruitList = recruitService.recruitList(revo);
		model.addAttribute("recruitList", recruitList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", revo);
		
		return "recruit/recruitList";
	}
	
	/***************************************************************
	 * 글 상세보기 구현
	 *************************************************************/
	
	@RequestMapping(value = "/recruitView.do", method = RequestMethod.GET)
	public String recruitView(@ModelAttribute RecruitVO revo, Model model) throws Exception {
		System.out.println("recruitView 호출 성공");
		RecruitVO recruitview = new RecruitVO();
		recruitview = recruitService.recruitView(revo);
		
		model.addAttribute("recruitView", recruitview);
		
		return "recruit/recruitView";
	}

	/***************************************************************
	 * 글 쓰기 폼 출력하기
	 *************************************************************/

	@RequestMapping(value = "/recruitInsertForm.do", method = RequestMethod.GET)
	public String recruitInsertForm(@ModelAttribute MemberVO mvo, Model model, HttpSession session) throws Exception {
		System.out.println("recruitInsertForm 호출 성공");
		
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		System.out.println(m_id);
	
		model.addAttribute("member", memberService.memberSelect(m_id));
		
		return "recruit/recruitInsertForm";
	}
	
	
	/***************************************************************
	 * 글 쓰기 등록 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/recruitInsert.do")
	public String recruitInsert(@ModelAttribute RecruitVO revo) throws Exception {
		System.out.println("recruitInsert 호출 성공");
		int result = 0;
		String url = "";
		result = recruitService.recruitInsert(revo);

		if (result == 1) {
			url = "/recruit/recruitList.do";
		} else {
			url = "/recruit/recruitInsertForm.do";
		}
		return "redirect:" + url;
	}

	/***************************************************************
	 * 글 수정 폼 출력하기
	 ***************************************************************/

	@RequestMapping(value = "/recruitUpdateForm.do")
	public String recruitUpdateForm(@ModelAttribute RecruitVO revo, Model model) throws Exception {
		System.out.println("recruitUpdateForm 호출 성공");

		RecruitVO updateRecruitData = new RecruitVO();
		updateRecruitData = recruitService.recruitView(revo);
		
		model.addAttribute("updateRecruitData", updateRecruitData);
		return "recruit/recruitUpdateForm";
	}

	/***************************************************************
	 * 글 수정 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/recruitUpdate.do", method = RequestMethod.POST)
	public String recruitUpdate(@ModelAttribute RecruitVO revo) throws Exception {

		System.out.println("recruitUpdate 호출 성공");

		int result = 0;
		String url = "";
		System.out.println(revo.getHr_no());
		result = recruitService.recruitUpdate(revo);

		if (result == 1) {
			url = "/recruit/recruitView.do?hr_no=" + revo.getHr_no();
		} else {
			url = "/recruit/recruitUpdateForm.do?hr_no=" + revo.getHr_no();
		}

		return "redirect:" + url;
	}

	
}