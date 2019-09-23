package com.fly.admin.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.admin.member.service.AdminMemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.paging.util.Paging;
import com.fly.paging.util.Util;
import com.fly.paging.vo.PagingVO;

@Controller
@RequestMapping(value = "/admin/member")
public class AdminMemberController {
	
	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;

	// 회원 리스트를 보여준다.
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
	public String showMemberListChk(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request) {

		// 페이지 세팅
		Paging.setPage(mvo, 15);
		// 전체 레코드수
		int total = adminMemberService.getTotalSize(mvo);
		// 글번호 재설정
		int count = total - (Util.nvl(mvo.getPage()) -1 ) * Util.nvl(mvo.getPageSize());
		
		model.addAttribute("memberList", adminMemberService.getMemberList(mvo));
		//paging.setTotal( adminMemberService.getTotalSize(status, name) );
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", mvo);
		
		
		return "/admin/member/memberList";
	}
	// 회원상태변경
	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public String updateMemberChk(@ModelAttribute MemberVO mvo, HttpServletRequest request) {
		adminMemberService.updateMember(mvo);
		return "redirect:/admin/member/memberList.do";
	}
		
	// 선택된 회원에 등록된 대관갯수 확인
	 @RequestMapping(value = "/searchReservedCnt.do", method = RequestMethod.POST)
	 @ResponseBody
	 public String searchReservedChk(@ModelAttribute MemberVO mvo, HttpServletRequest request) {
		 // 회원type 사업자 0, 일반 1 
		 int m_type = mvo.getM_type();
		 System.out.println(m_type);
		 System.out.println(mvo.getM_id());
		 int result = -1;
		  if(m_type == 0) {
			  // 사업자
			  result = adminMemberService.searchClientPlaceCnt(mvo);
			  if(result > 0) {
				  result = -2;
				  return result + "";
			  }
		  }else {
			  // 일반
			  result = adminMemberService.searchUserReservedCnt(mvo);
			  if(result > 0) {
				  result = -3;
					return result + "";
			  }
		  }
		  
		 return result + "";
	 }
	 
}
