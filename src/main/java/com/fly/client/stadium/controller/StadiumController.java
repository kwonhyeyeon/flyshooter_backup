package com.fly.client.stadium.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fly.client.items.service.ItemsService;
import com.fly.client.items.vo.ItemsVO;
import com.fly.client.place.service.ClientPlaceService;
import com.fly.client.stadium.service.ClientStadiumService;
import com.fly.client.util.FileUploadUtil;
import com.fly.client.util.MakeListUtils;
import com.fly.member.join.vo.MemberVO;
import com.fly.member.place.vo.PlaceVO;
import com.fly.member.stadium.vo.StadiumVO;

//import com.fly.client.stadium.service.StadiumService;

@Controller
@RequestMapping(value = "/mypage")
public class StadiumController {
	
	@Autowired
	private ClientStadiumService stadiumService;

	@Autowired
	private ClientPlaceService placeService;

	@Autowired
	private ItemsService itemsService;
	
	// 구장 목록 구현하기
	@RequestMapping(value = "/placeChoice.do", method = RequestMethod.GET)
	public String placeChoice_ClientChk(Model model, HttpSession session, HttpServletRequest request) {
		MemberVO sessionMvo = (MemberVO) session.getAttribute("mvo");
		String m_id = sessionMvo.getM_id();
		
		List<PlaceVO> placeChoice = placeService.placeChoice(m_id);
		model.addAttribute("placeChoice", placeChoice);
		model.addAttribute("data");
		return "mypage/stadiumList";
	}

	@RequestMapping(value = "/stadiumList.do", method = RequestMethod.GET, produces= "text/html; charset=UTF-8")
	@ResponseBody
	public String stadiumList_ClientChk(Model model, @RequestParam(value = "p_num") String p_num) {
		List<StadiumVO> Slist = stadiumService.stadiumList(p_num);
		List<ItemsVO> Ilist = itemsService.itemsList(p_num);
		
		return MakeListUtils.makeList(Slist, Ilist, p_num);
	}

	// 구장 상세보기

	@RequestMapping(value = "/stadiumDetail.do", method = RequestMethod.POST)
	public ModelAndView stadiumDetail_ClientChk(@ModelAttribute StadiumVO svo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String s_no = svo.getS_no()+"";
		svo = stadiumService.stadiumDetail(s_no);
		
		mav.addObject("s_img1", svo.getS_img1());
		mav.addObject("s_img2", svo.getS_img2());
		mav.addObject("s_img3", svo.getS_img3());
		
		mav.addObject("svo", svo);
		
		mav.setViewName("mypage/stadiumDetailEdit");
		
		return mav;
	}

	// 경기장 등록 페이지 출력하기
	@RequestMapping(value = "/stadiumForm.do", method = RequestMethod.GET)
	public String writeForm_ClientChk(@RequestParam("p_num") String p_num, Model model
			, HttpServletRequest request) {
		model.addAttribute("p_num", p_num);
		return "mypage/stadiumForm";
	}
	
	// 경기장 등록
	@RequestMapping(value = "/stadiumInsert.do", method = RequestMethod.POST)
	public ModelAndView stadiumInsert_ClientChk(@ModelAttribute StadiumVO svo, @RequestParam("select")String select, MultipartHttpServletRequest request
			, HttpServletRequest request1) throws IOException, Exception{
		ModelAndView mav = new ModelAndView();
		if(svo.getFile1() != null && !(svo.getFile1().equals(""))){
	         String pt_image1 = FileUploadUtil.fileUpload(svo.getFile1(), request, "image1");
	         svo.setS_img1(pt_image1);
	         
	      }
	      if(svo.getFile2() != null && !(svo.getFile2().equals(""))){
	         String pt_image2 = FileUploadUtil.fileUpload(svo.getFile2(), request, "image2");
	         svo.setS_img2(pt_image2);
	         
	      }
	      if(svo.getFile3() != null && !(svo.getFile3().equals(""))){
	         String pt_image3 = FileUploadUtil.fileUpload(svo.getFile3(), request, "image3");
	         svo.setS_img3(pt_image3);
	         
	      }
		int plus = Integer.parseInt(select);// 추가등록여부 확인을 위한 변수
		int result = stadiumService.stadiumInsert(svo);
		if (result == 1) {
			if (plus == 1) {
				mav.addObject("p_num", svo.getP_num());
				mav.setViewName("mypage/stadiumForm");
			} else {
				mav.setViewName("mypage/modifyLogin");
			}
		} else {
			mav.addObject("errCode", 1);
			mav.setViewName("mypage/stadiumForm");
		}
		return mav;
		
	}
	
	//경기장 수정
	@RequestMapping(value = "/stadiumModify.do", method = RequestMethod.POST)
	public String stadiumModify_ClientChk(@ModelAttribute StadiumVO svo, Model model, MultipartHttpServletRequest session, MultipartHttpServletRequest request
			, RedirectAttributes redirectAttr, HttpServletRequest request1) throws IOException {
		int result = 0;
		String url = "";
		if(svo.getFile1() != null && !(svo.getFile1().equals(""))){
	         String pt_image1 = FileUploadUtil.fileUpload(svo.getFile1(), request, "image1");
	         svo.setS_img1(pt_image1);
	         
	      }
	      if(svo.getFile2() != null && !(svo.getFile2().equals(""))){
	         String pt_image2 = FileUploadUtil.fileUpload(svo.getFile2(), request, "image2");
	         svo.setS_img2(pt_image2);
	         
	      }
	      if(svo.getFile3() != null && !(svo.getFile3().equals(""))){
	         String pt_image3 = FileUploadUtil.fileUpload(svo.getFile3(), request, "image3");
	         svo.setS_img3(pt_image3);
	         
	      }
		result = stadiumService.stadiumModify(svo);
	
		if (result >= 1) {
			redirectAttr.addAttribute("p_num", svo.getP_num());
			url = "/mypage/placeChoice.do";
		} else {
			model.addAttribute("errCode", 1);
			model.addAttribute("s_no", svo.getS_no());
			url = "/mypage/placeChoice.do";
		}
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "/closeStadium.do", method = RequestMethod.POST)
	@ResponseBody
	public String closeStadium_ClientChk(@RequestParam(value = "s_no", required = false, defaultValue = "0") String s_no) {
		int result = stadiumService.closeStadium(s_no);
		return result + "";
	}
		
	
}
