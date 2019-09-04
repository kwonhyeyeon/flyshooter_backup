package com.fly.member.join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fly.common.util.UserMailSendService;
import com.fly.member.join.service.MemberService;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.login.vo.LoginVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private UserMailSendService mailsender;

	@Autowired
	HttpServletRequest request;
	// @Autowired
	// private LoginService loginService;

	/******************************
	 * 회원가입 폼
	 ******************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String joingForm(Model model) {
		System.out.println("join.do get 방식에 의한 메서드 호출 성공");
		return "member/join";
	}

	/******************************
	 * 사용자 아이디 중복 체크 메서드
	 ******************************/
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm.do", method = RequestMethod.POST)
	public String userIdConfirm(String m_id) {
		int result = memberService.userIdConfirm(m_id);
		return result + "";
	}

	/******************************
	 * 회원 가입 처리
	 * 
	 * @throws Exception
	 ******************************/
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute MemberVO mvo) throws Exception {
		System.out.println("join.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.memberJoin(mvo);

		switch (result) {
		case 1:
			mav.addObject("errCode", 1); // userId already exist
			mav.setViewName("member/join");
			break;
		case 3:
			mav.addObject("errCode", 3);
			System.out.println("인증 메일 보내기 메서드");
			System.out.println("currnent join member: " + mvo.toString());
			mailsender.mailSendWithUserKey(mvo);
			mav.setViewName("member/join_email");

			// success to add new member; move to login page
			break;
		default:
			mav.addObject("errCode", 2); // failed to add new member
			mav.setViewName("member/join");
			break;
		}
		return mav;
	}

	// e-mail 인증 컨트롤러
	@RequestMapping(value="join_success", method=RequestMethod.GET)
	public String key_alterConfirm(@ModelAttribute("mvo") MemberVO mvo) throws Exception {
		mvo.setM_id(request.getParameter("m_id"));
		mvo.setEmail_confirm(request.getParameter("email_confirm"));
		
		mailsender.alter_userKey_service(mvo); // mailsender의 경우 @Autowired
		
		return "member/join_success";
	}

		

	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public ModelAndView memberModify(HttpSession session) {
		System.out.println("modify.do get방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("member/login");
			return mav;
		}

		MemberVO vo = memberService.memberSelect(login.getM_id());
		mav.addObject("member", vo);
		mav.setViewName("member/modify");
		return mav;
	}

	/*
	 * @RequestMapping(value = "/modify.do", method = RequestMethod.POST) public
	 * ModelAndView memberModifyProcess(@ModelAttribute("MemberVO") MemberVO mvo,
	 * HttpSession session) { log.info("modify.do post 방식에 의한 메서드 호출 성공");
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * LoginVO login = (LoginVO) session.getAttribute("login");
	 * 
	 * if (login == null) { mav.setViewName("common/member/login"); return mav; }
	 * 
	 * mvo.setM_id(login.getM_id()); MemberVO vo =
	 * memberService.memberSelect(mvo.getM_id()); if
	 * (loginService.loginSelect(mvo.getM_id(), mvo.getM_pw()) == null) {
	 * mav.addObject("errCOde", 1); mav.addObject("member", vo);
	 * mav.setViewName("member/modify"); return mav; } if
	 * (memberService.memberUpdate(mvo)) {
	 * mav.setViewName("redirect:/member/logout.do"); return mav; } else {
	 * mav.addObject("errCode", 2); mav.addObject("member", vo);
	 * mav.setViewName("member/modify"); return mav; } }
	 */

	@RequestMapping("/delete.do")
	public ModelAndView memberDelete(HttpSession session) {
		System.out.println("delete.do get방식에의한 메서드 호출 성공");

		ModelAndView mav = new ModelAndView();
		LoginVO login = (LoginVO) session.getAttribute("login");

		if (login == null) {
			mav.setViewName("member/login");
			return mav;
		}

		int errCode = memberService.memberDelete(login.getM_id());
		switch (errCode) {
		case 2:
			mav.setViewName("redirect:/member/logout.do");
			break;

		case 3:
			mav.addObject("errCOde", 3);
			mav.setViewName("member/login");
			break;
		}
		return mav;
	}
}