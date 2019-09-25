package com.fly.member.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.common.util.Util;
import com.fly.member.common.page.Paging;
import com.fly.member.common.vo.CommonVO;
import com.fly.member.join.service.MemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.match.service.MatchService;
import com.fly.member.match.vo.MatchVO;

@Controller
@RequestMapping(value = "/match")
public class MatchController {
	private static Logger log = LoggerFactory.getLogger(MatchController.class);

	@Autowired
	private MatchService matchService;
	
	@Autowired
	private MemberService memberService;

	/***************************************************************
	 * 글 목록 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/matchList.do", method = RequestMethod.GET)
	public String matchList(@ModelAttribute MatchVO mavo, CommonVO cvo, Model  model) {
		log.info("matchList 호출 성공");
		System.out.println("matchList 호출 성공");
		
		String result = "";
		
		// 매치 일자가 현재날짜지 날 경우 신청여부를 종료로 바꾸는 메소드
		matchService.updateMbdate(mavo);
		model.addAttribute("updateMbdate", mavo);
		
		// 페이징 세팅
		Paging.setPage(mavo);
		
		// 전체 레코드 수 구현 하기
		System.out.println(mavo.getKeyword());
		int total = matchService.matchListCnt(mavo);
		
		System.out.println(total);
		log.info("total = "+ total);

		// 글 번호 재설정
		int count = total - (Util.nvl(mavo.getPage())-1) * Util.nvl(mavo.getPageSize());
		log.info("count = " + count);
		
		List<MatchVO> matchList = matchService.matchList(mavo);
		model.addAttribute("matchList", matchList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", mavo);
		return "match/matchList";
	}

	/***************************************************************
	 * 글 상세보기 구현
	 *************************************************************/

	@RequestMapping(value = "/matchView.do", method = RequestMethod.GET)
	public String matchView(@ModelAttribute MatchVO mavo, Model model) throws Exception {
		log.info("matchview 호출 성공");
		System.out.println("matchview 호출 성공");
		MatchVO matchview = new MatchVO();
		matchview = matchService.matchView(mavo);

		model.addAttribute("matchView", matchview);

		return "match/matchView";
	}

	/***************************************************************
	 * 글 쓰기 폼 출력하기
	 *************************************************************/

	@RequestMapping(value = "/matchInsertForm.do", method = RequestMethod.GET)
	public String matchInsertForm_LoginChk(@ModelAttribute MemberVO mvo, Model model, HttpSession session, HttpServletRequest request) throws Exception {
		log.info("matchInsertForm 호출 성공");
		System.out.println("matchInsertForm 호출 성공");
		
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		System.out.println(m_id);
	
		model.addAttribute("member", memberService.memberSelect(m_id));
		
		return "match/matchInsertForm";
	}

	/***************************************************************
	 * 글 쓰기 등록 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/matchInsert.do")
	public String matchInsert_LoginChk(@ModelAttribute MatchVO mavo, HttpServletRequest request) throws Exception {
		log.info("matchInsert 호출 성공");
		System.out.println("matchInsert 호출 성공");
		int result = 0;
		String url = "";
		result = matchService.matchInsert(mavo);

		if (result == 1) {
			url = "/match/matchList.do";
		} else {
			url = "/match/matchInsertForm.do";
		}
		return "redirect:" + url;
	}

	/***************************************************************
	 * 글 수정 폼 출력하기
	 ***************************************************************/

	@RequestMapping(value = "/matchUpdateForm.do")
	public String matchUpdateForm_LoginChk(@ModelAttribute MatchVO mavo, Model model, HttpServletRequest request) throws Exception {
		log.info("matchUpdateForm 호출 성공");

		System.out.println("matchUpdateForm 호출 성공");

		MatchVO updatematchdata = new MatchVO();
		updatematchdata = matchService.matchView(mavo);

		model.addAttribute("updateMatchData", updatematchdata);
		return "match/matchUpdateForm";
	}

	/***************************************************************
	 * 글 수정 구현하기
	 ***************************************************************/

	@RequestMapping(value = "/matchUpdate.do", method = RequestMethod.POST)
	public String matchUpdate_LoginChk(@ModelAttribute MatchVO mavo, HttpServletRequest request) throws Exception {

		log.info("matchUpdate 호출 성공");
		System.out.println("matchUpdate 호출 성공");

		int result = 0;
		String url = "";
		System.out.println(mavo.getMb_no());
		result = matchService.matchUpdate(mavo);

		if (result == 1) {
			url = "/match/matchList.do?mb_no=" + mavo.getMb_no();
		} else {
			url = "/match/matchUpdateForm.do?mb_no=" + mavo.getMb_no();
		}

		return "redirect:" + url;
	}

}
