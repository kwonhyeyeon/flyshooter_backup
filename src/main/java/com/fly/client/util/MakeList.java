package com.fly.client.util;

import java.util.List;

import com.fly.client.items.vo.ItemsVO;
import com.fly.member.stadium.vo.StadiumVO;

public class MakeList {
	
	public static String makeList(List<StadiumVO> Slist, List<ItemsVO> Ilist, String p_num) {

		String result = "";
		System.out.println(Slist.size());
		System.out.println(Ilist.size());
		if (Slist.size() > 0 && Ilist.size() > 0) {
			result = "<div id='tab1' class='tab_content'>";
			result +="<table>";
			result +="<tr>";
			result +="<th>번호</th>";
			result +="<th>경기장명</th>";
			result +="<th>수용인원</th>";
			result +="<th>경기장 상태</th>";
			result +="</tr>";
			for (int i = 0; i < Slist.size(); i ++) {
				result +="<tr class='stadiumList' data-num='"+Slist.get(i).getS_no()+"'>";
				result +="<td>"+Slist.get(i).getS_no()+"</td>";
				result +="<td class='detailPage'>"+Slist.get(i).getS_name()+"</td>";
				result +="<td>"+Slist.get(i).getS_people()+"</td>";
				result +="<td>"+Slist.get(i).getS_status()+"</td>";
				result +="</tr>";
			}
			result +="</table>";
			result +="<form id='placenum' action='/mypage/stadiumForm.do'>";
			result +="<input type='hidden' name='p_num' value="+p_num+">";
			result +="<input type='submit' value='경기장 추가 등록' id='stadiumInsert'/>";
			result +="</form>";
			result +="</div>";
			result +="<div id='tab2' class='tab_content' style='display:none;'>";
			result +="<table>";
			result +="<tr>";
			result +="<th>번호</th>";
			result +="<th>용품명</th>";
			result +="<th>대여료</th>";
			result +="</tr>";
			for (int i = 0; i < Ilist.size(); i ++) {
			result +="<tr>";
			result +="<td>"+Ilist.get(i).getI_no()+"</td>";
			result +="<td>"+Ilist.get(i).getI_name()+"</td>";
			result +="<td>"+Ilist.get(i).getI_rental_fee()+"</td>";
			result +="</tr>";
			}
			result +="</table>";
			result +="</div>";
		}else if (Slist.size() > 0){
			result = "<div id='tab1' class='tab_content'>";
			result +="<table>";
			result +="<tr>";
			result +="<th>번호</th>";
			result +="<th>경기장명</th>";
			result +="<th>수용인원</th>";
			result +="<th>경기장 상태</th>";
			result +="</tr>";
			for (int i = 0; i < Slist.size(); i ++) {
				result +="<tr class='stadiumList' data-num='"+Slist.get(i).getS_no()+"'>";
				result +="<td>"+Slist.get(i).getS_no()+"</td>";
				result +="<td class='detailPage'>"+Slist.get(i).getS_name()+"</td>";
				result +="<td>"+Slist.get(i).getS_people()+"</td>";
				result +="<td>"+Slist.get(i).getS_status()+"</td>";
				result +="</tr>";
			}
			result +="</table>";
			result +="<form id='placenum' action='/mypage/stadiumForm.do'>";
			result +="<input type='hidden' name='p_num' value="+p_num+">";
			result +="<input type='submit' value='경기장 추가 등록' id='stadiumInsert'/>";
			result +="</form>";
			result +="</div>";
			result +="<div id='tab2' class='tab_content' style='display:none;'>";
			result +="<table>";
			result +="<tr>";
			result +="<th>번호</th>";
			result +="<th>용품명</th>";
			result +="<th>대여료</th>";
			result +="</tr>";
			result +="<tr>";
			result +="<td colspan='3'>선택된 구장에 등록된 용품이 없습니다</td>";
			result +="</tr>";
			result +="</table>";
			result +="</div>";
		}else if (Ilist.size() > 0) {
			result = "<div id='tab1' class='tab_content'>";
			result +="<p>선택된 구장에 등록된 경기장이 없습니다</p>";
			result +="<form id='placenum' action='/mypage/stadiumForm.do'>";
			result +="<input type='hidden' name='p_num' value="+p_num+">";
			result +="<input type='submit' value='경기장 등록' id='stadiumInsert'/>";
			result +="</form>";
			result +="</div>";
			result +="<div id='tab2' class='tab_content' style='display:none;'>";
			result +="<table>";
			result +="<tr>";
			result +="<th>번호</th>";
			result +="<th>용품명</th>";
			result +="<th>대여료</th>";
			result +="</tr>";
			result +="</table>";
			result +="</div>";
		}else {
			result = "<div id='tab1' class='tab_content'>";
			result +="<p>선택된 구장에 등록된 경기장이 없습니다</p>";
			result +="<form id='placenum' action='/mypage/stadiumForm.do'>";
			result +="<input type='hidden' name='p_num' value="+p_num+">";
			result +="<input type='submit' value='경기장 등록' id='stadiumInsert'/>";
			result +="</form>";
			result +="</div>";
			result +="<div id='tab2' class='tab_content' style='display:none;'>";
			result +="<table>";
			result +="<tr>";
			result +="<th>번호</th>";
			result +="<th>용품명</th>";
			result +="<th>대여료</th>";
			result +="</tr>";
			result +="<tr>";
			result +="<td colspan='3'>선택된 구장에 등록된 용품이 없습니다</td>";
			result +="</tr>";
			result +="</table>";
			result +="</div>";
		}
			
		return result;
	}
}
