package com.fly.admin.calculate.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fly.admin.calculate.service.AdminCalculateService;
import com.fly.client.calculate.vo.CalculateVO;
import com.fly.member.stadium.vo.StadiumVO;
import com.fly.paging.util.Paging;
import com.fly.paging.util.Util;

@Controller
@RequestMapping(value = "/admin/place")
public class AdminCalculateController {

	@Resource(name = "adminCalculateService")
	private AdminCalculateService adminCalculateService;

	// 관리자 정산 목록 구현하기
	@RequestMapping(value = "/adminCalculateForm.do", method = RequestMethod.GET)
	public String adminCalculateForm() {
		System.out.println("adminCalculateForm 호출 성공");

		return "/admin/place/adminCalculate";
	}

	// 관리자 정산 목록 구현하기
	@RequestMapping(value = "/calculate.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String adminCalculateList(Model model, @ModelAttribute CalculateVO cvo) {
		System.out.println("calculate 호출 성공");
		// 페이지 세팅
		Paging.setPage(cvo, 15);
		// 전체 레코드수
		int total = adminCalculateService.pageingSize(cvo);
		// 글번호 재설정
		int count = total - (Util.nvl(cvo.getPage()) - 1) * Util.nvl(cvo.getPageSize());

		System.out.println(total);
		System.out.println(count);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", cvo);
		
		List<CalculateVO> list = adminCalculateService.adminCalculateList(cvo);
		StringBuffer AChtml = new StringBuffer(); // 빈버퍼생성
		AChtml.append("<table class='table-style'>"); // 구장 리스트
		AChtml.append("<tr>");
		AChtml.append("<th>번호</th>");
		AChtml.append("<th>신청일</th>");
		AChtml.append("<th>회원 ID</th>");
		AChtml.append("<th>대표자명</th>");
		AChtml.append("<th>대관 건수</th>");
		AChtml.append("<th>환불 건수</th>");
		AChtml.append("<th>지급액</th>");
		AChtml.append("<th>지급일</th>");
		AChtml.append("<th>지급 상태</th>");
		AChtml.append("</tr>");
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				AChtml.append("<tr class='calculate' data-num = '${calculate.p_num}'>");
				AChtml.append("<td class='indexC_no'>");
				AChtml.append(list.get(i).getC_no());
				AChtml.append("</td>");
				AChtml.append("<td>");
				AChtml.append(list.get(i).getC_regdate());
				AChtml.append("</td>");
				AChtml.append("<td>");
				AChtml.append(list.get(i).getM_id());
				AChtml.append("</td>");
				AChtml.append("<td>");
				AChtml.append(list.get(i).getP_ceo());
				AChtml.append("</td>");
				AChtml.append("<td>");
				AChtml.append(list.get(i).getC_rental_cnt());
				AChtml.append("</td>");
				AChtml.append("<td>");
				AChtml.append(list.get(i).getC_return_cnt());
				AChtml.append("</td>");
				AChtml.append("<td>");
				AChtml.append(list.get(i).getC_payment());
				AChtml.append("</td>");
				AChtml.append("<td>");
				if (list.get(i).getC_payment_date() == null) {
					AChtml.append("정산 대기");
				} else {
					AChtml.append(list.get(i).getC_payment_date());
				}
				AChtml.append("</td>");
				AChtml.append("<td>");
				if (list.get(i).getC_status() == 1) {
					AChtml.append("<input type='button' value='지급 완료'/>");
				} else if (list.get(i).getC_status() == -1) {
					AChtml.append("<input type='button' value='지급 대기' class='cal_update'/>");
				}
				AChtml.append("</td>");

				AChtml.append("</tr>");
     			
			}
		} else {
			AChtml.append("<tr>");
			AChtml.append("<td class='empty' colspan='9'>조회된 구장이 없습니다</td>");
			AChtml.append("</tr>");
		}
		AChtml.append("</table>"); // 정산 리스트
		AChtml.append("<div id='boardSearch'>");//paging view
		AChtml.append("<form id='f_search' name='f_search'>");
		AChtml.append("<input type='hidden' id='page' name='page' value='");
		System.out.println(cvo.getPage()+"getPage");
		System.out.println(cvo.getPageSize()+"getPageSize");
		System.out.println(total+"total");
		AChtml.append(cvo.getPage());
		AChtml.append("'/>");
		AChtml.append("</form>");
		AChtml.append("</div>");
		AChtml.append("<div class='pagination'>");
		AChtml.append("<tag:paging page='");
		AChtml.append(cvo.getPage());
		AChtml.append("' total='");
		AChtml.append(total);
		AChtml.append("' list_size='");
		AChtml.append(cvo.getPageSize());
		AChtml.append("' />");
		AChtml.append("</div>");
		
		return AChtml.toString();

	}

	// 관리자 정산 목록 구현하기
	@RequestMapping(value = "/adminCalculateUpdate.do", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String adminCalculateUpdate(Model model, @ModelAttribute CalculateVO cvo) {
		System.out.println("cal_update 호출 성공");
		String result = "0";
		try {
			String result1 = adminCalculateService.adminCalculateUpdate(cvo.getC_no()) + "";
			String result2 = adminCalculateService.adminCRentalUpdate(cvo.getP_num()) + "";
			result = "1";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = "-1";
		}

		return result;
	}
}
