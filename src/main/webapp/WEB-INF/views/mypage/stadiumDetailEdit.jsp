<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 상세보기 수정</title>
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#s_stadiumModifyForm").submit(function() {
		return stadiumModifyCheck();
	});
</script>
<body>
	<div class="contentContainer">
	<h3>${s_no}</h3>
		<div class="contentTB">
			<form id="s_stadiumModifyForm" action="/mypage/stadiumModify.do" method="post">
				<ul>
					<li><label>날짜 별 요금</label>
					평일 주간 요금 <input type="text" value="${s_d_fee}" name="s_d_fee" id="s_d_fee"/>
					평일 야간 요금 <input type="text" value="${s_n_fee}" name="s_n_fee" id="s_n_fee"/></li>
				
					<li>
						주말 주간 요금 <input type="text" value="${s_d_fee_w}" name="s_d_fee_w" id="s_d_fee_w"/>
						주말 야간 요금 <input type="text" value="${s_n_fee_w}" name="s_n_fee_w" id="s_n_fee_w"/>
					</li>
					<li>
						최소 이용 가능 시간 
						<div>${s_hours}</div>
						<select name="s_hours" id="s_hours">
							<option value="1">1시간</option>
							<option value="3">2시간</option>
						</select>
					</li>
					<li>
						수용 인원 <input type="text" value="${s_people}" name="s_people" id="s_people"/>
						경기장 명 <input type="text" value="${s_name}" name="s_name" id="s_name"/>
					</li>
					<li>
						경기장 사이즈
						<div>${s_size}</div>
						<select name="s_size" class="s_size" id="s_size">
							<option value="1">40*20</option>
							<option value="2">33*21</option>
							<option value="3">15*12</option>
						</select>
						
						경기장 실내/외 선택
						<div>${s_in_out}</div>
						<select name="s_in_out" class="s_in_out" id="s_in_out">
							<option value="1">실내</option>
							<option value="2">실외</option>
		</select>
					</li>
					<li>
						<input type="text" value="${s_img1}"size="30" id="s_img1"/>
							<img src="" onclick="document.getElementById('file').click();">
						<input id="s_img1" value="${s_img1}" name="s_img1" type="file" onchange="document.getElementById('s_img1').value=this.value;" accept=".gif, .jpg, .png">
						<input type="text" value="${s_img2}"size="30" id="s_img2"/>
							<img src="" onclick="document.getElementById('file').click();">
						<input id="s_img2" value="${s_img2}" name="s_img2" type="file" onchange="document.getElementById('s_img2').value=this.value;" accept=".gif, .jpg, .png">
						<input type="text" value="${s_img3}"size="30" id="s_img3"/>
							<img src="" onclick="document.getElementById('file').click();">
						<input id="s_img3" value="${s_img3}" name="s_img3" type="file" onchange="document.getElementById('s_img3').value=this.value;" accept=".gif, .jpg, .png">
					</li>
					<li>
						경기장 상태
						<c:choose>
							<c:when test="${s_status eq '0'}">
								close
							</c:when>
							<c:when test="${s_status eq '1' }">
								open
							</c:when>
						</c:choose>
					<select name="s_status" id="s_status">
						<option value="" selected disabled>운영상태 변경</option>
						<option value="0">close</option>
						<option value="1">open</option>
					</select>
					</li>
					
				</ul>
				<div>
					<input type="submit" value="수정하기"> 
					<input type="button" id="StadiumListBtn" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>