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

import com.fly.common.util.BCrypt;
import com.fly.common.util.SHA256;
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
	@RequestMapping(value = "join_success", method = RequestMethod.GET)
	public String key_alterConfirm(@ModelAttribute("mvo") MemberVO mvo) throws Exception {
		mvo.setM_id(request.getParameter("m_id"));
		mvo.setEmail_confirm(request.getParameter("email_confirm"));

		mailsender.alter_userKey_service(mvo); // mailsender의 경우 @Autowired

		return "member/join_success";
	}

	@RequestMapping(value = "/serchMember.do", method = RequestMethod.GET)
	public ModelAndView serchId(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) {
		System.out.println("serchMember.do get 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/serchMember");
		return mav;
	}

	@RequestMapping(value = "/serchId.do", method = RequestMethod.POST)
	public ModelAndView idSerch(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) {
		System.out.println("serchId.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		MemberVO result = new MemberVO();
		
		result = memberService.memberidserch(mvo);
		if (result.getM_id().equals("")) {
			mav.addObject("errCode", 1); 
			mav.setViewName("member/serchMember");
		}
		mav.addObject("m_id", result.getM_id());
		mav.setViewName("member/serchId");
		return mav;
	}
	
	@RequestMapping(value = "/serchPw.do", method = RequestMethod.POST)
	public ModelAndView pwSerch(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) throws Exception {
		System.out.println("serchPw.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		MemberVO result = new MemberVO();
		
		System.out.println("비밀번호 변경 메일 보내기 메서드");
		System.out.println("currnent join member: " + mvo.toString());
		mailsender.pwModify(mvo);
		mav.addObject("errCode", 3); 
		mav.setViewName("member/serchMember");
		return mav;
	}

	@RequestMapping(value = "/pwmodify.do", method = RequestMethod.GET)
	public ModelAndView pwmodifyForm(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) throws Exception {
		System.out.println("pwmodify.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("errCode", 3); 
		mav.addObject("m_id", mvo.getM_id()); 
		mav.setViewName("member/pwmodify");
		return mav;
	}
	
	@RequestMapping(value = "/pwmodify.do", method = RequestMethod.POST)
	public ModelAndView pwmodify_success(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) throws Exception {
		System.out.println("pwmodify.do post 방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		int result = 0;
		result = memberService.pwUpdate(mvo);

		if (result != 3) {
			mav.addObject("errCode", 1); // 수정 실패
			mav.setViewName("mypage/pwmodify");
		} else {
			mav.setViewName("member/login");
		}
		return mav;
	}
	
	@RequestMapping(value = "/mypage/modifyLogin.do", method = RequestMethod.GET)
	public ModelAndView ModifyLogin(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) {
		System.out.println("modifyLogin.do get 방식에 의한 메서드 호출 성공");
		String m_id = "";
		ModelAndView mav = new ModelAndView();
		try {
			m_id = (String) session.getAttribute("m_id");
			m_id.length();
		} catch (Exception e) {
			mav.addObject("errCode", 2);
			mav.setViewName("member/login");
			return mav;
		}
		mav.setViewName("mypage/modifyLogin");
		return mav;
	}

	@RequestMapping(value = "/mypage/modify.do", method = RequestMethod.POST)
	public ModelAndView MemberModify(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session) throws Exception {
		System.out.println("modify.do POST 방식에 의한 메서드 호출 성공");
		String m_id = (String) session.getAttribute("m_id");
		String m_pw = mvo.getM_pw();
		String m_name = null;
		String m_phone = null;
		ModelAndView mav = new ModelAndView();

		mvo.setM_id(m_id);
		MemberVO mvoDB = memberService.memberSelect(mvo.getM_id());
		m_name = mvoDB.getM_name();
		m_phone = mvoDB.getM_phone();
		// SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다
		SHA256 sha = SHA256.getInsatnce();

		// SHA256클래스의 getSHA256()메소드를 사용해
		// 원래의 비밀번호를 SHA-256방식으로 암호화
		String shaPass = sha.getSha256(m_pw.getBytes());
		// 로그인이 틀리면 , 로그인 시도횟수를 1증가 시키고,
		// 로그인 실패 시간을 DB에 업데이트 한다.
		if (!BCrypt.checkpw(shaPass, mvoDB.getM_pw())) {
			System.out.println("비밀번호 불일치");

			mav.addObject("errCode", 1);
			mav.setViewName("mypage/modifyLogin");
			return mav;
		}
		// 로그인이 성공하면 , 로그인 시도 횟수 0으로 초기화
		// 마지막으로 로그인 실패 시간 0으로 reset,
		// 성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트
		else {
			System.out.println("비밀번호 일치");

			System.out.println("로그인 성공");
			mav.addObject("m_name", m_name);
			mav.addObject("m_phone", m_phone);
			mav.setViewName("/mypage/modify");
			return mav;
		}
	}

	@RequestMapping(value = "/mypage/modify_success.do", method = RequestMethod.POST)
	public ModelAndView memberModifyProcess(@ModelAttribute MemberVO mvo, HttpSession session) {
		System.out.println("modify_success.do post방식에 의한 메서드 호출 성공");
		ModelAndView mav = new ModelAndView();

		int result = 0;
		result = memberService.memberUpdate(mvo);

		if (result != 3) {
			mav.addObject("errCode", 1); // 수정 실패
			mav.setViewName("mypage/modify");
		} else {
			mav.setViewName("mypage/modifyLogin");
		}
		return mav;
	}

	@RequestMapping("/delete.do")
	public ModelAndView memberDelete(HttpSession session) {
		System.out.println("delete.do get방식에의한 메서드 호출 성공");

		ModelAndView mav = new ModelAndView();
		
		String m_id = (String) session.getAttribute("m_id");

		int errCode = memberService.memberDelete(m_id);
		if (errCode == 3) {
			session.invalidate();
			mav.setViewName("/member/login");
			return mav;
		} else {
			mav.addObject("errCode", 3);
			mav.setViewName("/mypage/modifyLogin");
			return mav;
		} 
		
	}
}