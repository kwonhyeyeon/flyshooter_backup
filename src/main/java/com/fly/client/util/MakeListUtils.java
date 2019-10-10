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

	public static String setIFhtml(String p_num) { // 용품 등록이 안됐을 경우
		StringBuffer IFhtml = new StringBuffer(); // 빈버퍼생성
		IFhtml.append("<div id='tabI' class='tab-content'>");
		IFhtml.append("<p class='noItem'>선택된 구장에 등록된 용품이 없습니다</p>");
		IFhtml.append("<div class='btnArea'><button id='IPlus' class='active'>용품 추가</button></div>");
		IFhtml.append("</div>");
		
		return IFhtml.toString();
	}

	public static String setSFhtml(String p_num) { // 경기장 등록이 안됐을 경우
		StringBuffer SFhtml = new StringBuffer(); // 빈버퍼생성
		SFhtml.append("<div id='tabS' class='tab-content'>");
		SFhtml.append("<p class='noItem'>선택된 구장에 등록된 경기장이 없습니다</p>");
		SFhtml.append("<form id='placenum' action='/mypage/stadiumForm.do'>");
		SFhtml.append("<input type='hidden' name='p_num' value=");
		SFhtml.append(p_num);
		SFhtml.append(">");
		SFhtml.append("<div class='btnArea'><input type='submit' id='stadiumInsert' class='insertBtn' value='경기장 등록' /></div>");
		SFhtml.append("</form>");
		SFhtml.append("</div>");
		
		return SFhtml.toString();
	}

	public static String setIShtml(List<ItemsVO> Ilist, String p_num) { // 용품이 등록되어있을 경우
		StringBuffer IShtml = new StringBuffer(); // 빈버퍼생성
		IShtml.append("<div id='tabI' class='tab-content'>");
		IShtml.append("<div class='insertArea'>");
		IShtml.append("<button id='IPlus' class='insertBtn'>용품 추가</button>");
		IShtml.append("</div>");
		IShtml.append("<table class='listTbl'>");
		IShtml.append("<tr class='bgTr'>");
		IShtml.append("<th>번호</th>");
		IShtml.append("<th>용품명</th>");
		IShtml.append("<th>대여료</th>");
		IShtml.append("<th>용품 삭제</th>");
		IShtml.append("<th>노출 여부</th>");
		IShtml.append("</tr>");
		for (int i = 0; i < Ilist.size(); i++) {
			IShtml.append("<tr data-num=");
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
			IShtml.append("<td><button id='IRemove' class='btninTbl'>삭제하기</button></td>");
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
		IShtml.append("</div>");

		return IShtml.toString();
	}

	public static String setSShtml(List<StadiumVO> Slist, String p_num) { // 경기장이 등록되어 있을 경우
		StringBuffer SShtml = new StringBuffer(); // 빈버퍼생성
		SShtml.append("<div id='tabS' class='tab-content'>");
		SShtml.append("<form id='placenum' action='/mypage/stadiumForm.do'>");
		SShtml.append("<input type='hidden' name='p_num' value=");
		SShtml.append(p_num);
		SShtml.append(">");
		SShtml.append("<div class='insertArea'>");
		SShtml.append("<input type='submit' id='stadiumInsert' class='insertBtn' value='경기장 추가 등록' />");
		SShtml.append("</div>");
		SShtml.append("</form>");
		SShtml.append("<table class='listTbl'>");
		SShtml.append("<tr class='bgTr'>");
		SShtml.append("<th>번호</th>");
		SShtml.append("<th>경기장명</th>");
		SShtml.append("<th>수용 인원</th>");
		SShtml.append("<th>경기장 상태</th>");
		SShtml.append("</tr>");
		for (int i = 0; i < Slist.size(); i++) {
			SShtml.append("<tr class='goDetail' data-num=");
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
			if (Slist.get(i).getS_status() == 1) {
				SShtml.append("승인 완료");
			}else {
				SShtml.append("미 승인");
			}
			SShtml.append("</td>");
			SShtml.append("</tr>");
		}
		SShtml.append("</table>");
		SShtml.append("</div>");

		return SShtml.toString();

	}
}
