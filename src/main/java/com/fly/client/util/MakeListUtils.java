package com.fly.client.util;

import java.util.List;

import com.fly.client.items.vo.ItemsVO;
import com.fly.member.stadium.vo.StadiumVO;

public class MakeListUtils {

	public static String makeList(List<StadiumVO> Slist, List<ItemsVO> Ilist, String p_num) {
		String result = "";
		if (Slist.size() > 0 && Ilist.size() > 0) {
			result= setSShtml(Slist, p_num)+setIShtml(Ilist, p_num);
		} else if (Slist.size() > 0) {
			result= setSShtml(Slist, p_num)+setIFhtml(p_num);
		} else if (Ilist.size() > 0) {
			result= setSFhtml(p_num)+setIShtml(Ilist, p_num);
		} else {
			result= setSFhtml(p_num)+setIFhtml(p_num);
		}
		return result;
	}

	public static String setIFhtml(String p_num) {
		StringBuffer IFhtml = new StringBuffer(); // 빈버퍼생성
		IFhtml.append("<div id='tab2' class='tab_content' style='display:none;'>");
		IFhtml.append("<table class='table'>");
		IFhtml.append("<tr>");
		IFhtml.append("<th>번호</th>");
		IFhtml.append("<th>용품명</th>");
		IFhtml.append("<th>대여료</th>");
		IFhtml.append("<th></th>");
		IFhtml.append("<th></th>");
		IFhtml.append("</tr>");
		IFhtml.append("<td colspan='5'>선택된 구장에 등록된 용품이 없습니다</td>");
		IFhtml.append("</tr>");
		IFhtml.append("</table>");
		IFhtml.append("<input type='button' value='추가' id='IPlus'/>");
		IFhtml.append("</div>");
		
		return IFhtml.toString();
	}

	public static String setSFhtml(String p_num) {
		StringBuffer SFhtml = new StringBuffer(); // 빈버퍼생성
		SFhtml.append("<div id='tab1' class='tab_content'>");
		SFhtml.append("<p>선택된 구장에 등록된 경기장이 없습니다</p>");
		SFhtml.append("<form id='placenum' action='/mypage/stadiumForm.do'>");
		SFhtml.append("<input type='hidden' name='p_num' value=");
		SFhtml.append(p_num);
		SFhtml.append(">");
		SFhtml.append("<input type='submit' value='경기장 등록' id='stadiumInsert'/>");
		SFhtml.append("</form>");
		SFhtml.append("</div>");
		
		return SFhtml.toString();
	}

	public static String setIShtml(List<ItemsVO> Ilist, String p_num) {
		StringBuffer IShtml = new StringBuffer(); // 빈버퍼생성
		IShtml.append("<div id='tab2' class='tab_content' style='display:none;'>");
		IShtml.append("<table class='table'>");
		IShtml.append("<tr>");
		IShtml.append("<th>번호</th>");
		IShtml.append("<th>용품명</th>");
		IShtml.append("<th>대여료</th>");
		IShtml.append("<th>삭제</th>");
		IShtml.append("<th>활성화/비활성화</th>");
		IShtml.append("</tr>");
		for (int i = 0; i < Ilist.size(); i++) {
			IShtml.append("<tr class='itemsList' data-num=");
			IShtml.append(Ilist.get(i).getI_no());
			IShtml.append(">");
			IShtml.append("<td>");
			IShtml.append(Ilist.get(i).getI_no());
			IShtml.append("</td>");
			IShtml.append("<td>");
			IShtml.append(Ilist.get(i).getI_name());
			IShtml.append("</td>");
			IShtml.append("<td>");
			IShtml.append(Ilist.get(i).getI_rental_fee());
			IShtml.append("</td>");
			IShtml.append("<td><span class='IRemove'>삭제하기</span></td>");
			IShtml.append("<td><span class='toggle-wrap'>");
			IShtml.append("<input class='toggle' id='");
			IShtml.append(Ilist.get(i).getI_no());
			IShtml.append("' type='checkbox' ");
			if (Ilist.get(i).getI_status() == 1) {
				IShtml.append("checked");
			}
			IShtml.append(" />");
			IShtml.append("<label class='toggle-btn' for='");
			IShtml.append(Ilist.get(i).getI_no());
			IShtml.append("'></label>");
			IShtml.append("</span></td>");
			IShtml.append("</tr>");
		}
		IShtml.append("</table>");
		IShtml.append("<input type='button' value='추가' id='IPlus'/>");
		IShtml.append("</div>");

		return IShtml.toString();
	}

	public static String setSShtml(List<StadiumVO> Slist, String p_num) {
		StringBuffer SShtml = new StringBuffer(); // 빈버퍼생성
		SShtml.append("<div id='tab1' class='tab_content'>"); // 붙이기
		SShtml.append("<table>");
		SShtml.append("<tr>");
		SShtml.append("<th>번호</th>");
		SShtml.append("<th>경기장명</th>");
		SShtml.append("<th>수용인원</th>");
		SShtml.append("<th>경기장 상태</th>");
		SShtml.append("</tr>");
		SShtml.append("<table>");
		SShtml.append("<table>");
		for (int i = 0; i < Slist.size(); i++) {
			SShtml.append("<tr class='detailPage' data-num=");
			SShtml.append(Slist.get(i).getS_no());
			SShtml.append(">");
			SShtml.append("<td>");
			SShtml.append(Slist.get(i).getS_no());
			SShtml.append("</td>");
			SShtml.append("<td>");
			SShtml.append(Slist.get(i).getS_name());
			SShtml.append("</td>");
			SShtml.append("<td>");
			SShtml.append(Slist.get(i).getS_people());
			SShtml.append("</td>");
			SShtml.append("<td>");
			SShtml.append(Slist.get(i).getS_status());
			SShtml.append("</td>");
			SShtml.append("</tr>");
		}
		SShtml.append("</table>");
		SShtml.append("<form id='placenum' action='/mypage/stadiumForm.do'>");
		SShtml.append("<input type='hidden' name='p_num' value=");
		SShtml.append(p_num);
		SShtml.append(">");
		SShtml.append("<input type='submit' value='경기장 추가 등록' id='stadiumInsert'/>");
		SShtml.append("</form>");
		SShtml.append("</div>");

		return SShtml.toString();

	}
}
