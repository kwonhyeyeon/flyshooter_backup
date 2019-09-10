<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 상세 보기 및 수정 페이지</title>
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeForm.js"></script>
<script>
	$(document).ready(function() {

		$(".p_holiday option").each(function() {
			if ($(this).val() == "${p_holiday}") {
				$(this).attr("selected", "selected");
			}
		});

		$(".p_open option").each(function() {
			if ($(this).val() == "${p_open}") {
				$(this).attr("selected", "selected");
			}
		});

		$(".p_close option").each(function() {
			if ($(this).val() == "${p_close}") {
				$(this).attr("selected", "selected");
			}
		});

		$("#p_status").change(function() {
			if ($("#p_status").val() == "2") {
				 jQuery('#p_holidaydate').show(); 
			}else if ($("#p_status").val() == "3") {
				jQuery('#p_holidaydate').hide(); 
				
				
			}else{
				 jQuery('#p_holidaydate').hide(); 
			}
			
		});
	});
</script>
<!-- 다음 우편 주소 api-->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h3>${pvo.p_name}</h3>
		</div>
		<div class="contentTB">
			<form id="p_placeModifyForm" action="/mypage/placeModify.do" method="post">
				<p>
				<ul>
					<li>구장명 <input type="text" value="${p_name}"></li>
					<li>대표자명 <input type="text" value="${p_ceo}"></li>
					<li>사업자번호 <input type="text" value="${p_num}"></li>
					<li>구장전화번호 <input type="text" value="${p_phone}"></li>
					<li>
						구장 주소
						<input type="text" id="sample6_postcode"
							value="${sample6_postcode }" placeholder="우편번호"> <br>
						<input type="text" id="sample6_address"
							value="${sample6_address }" placeholder="주소"> <br> 
						<input type="text" id="sample6_detailAddress"
							value="${sample6_detailAddress }" placeholder="상세주소"> <br>
						<input type="text" id="sample6_extraAddress"
							value="${sample6_extraAddress }" placeholder="참고항목">
						<input type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기">
					</li>
					<li>
						은행명 
						<select name="p_bank">
							<option selected>${p_bank }</option>
						</select>
					</li>
					<li>예금주명&nbsp;<input type="text" value="${p_account }"></li>
					<li>입금계좌번호 <input type="text" value="${p_account_num}"></li>
					<li>
						정기휴일
						<select class="p_holiday" name="p_holiday">
							<option value="0">일</option>
							<option value="1">월</option>
							<option value="2">화</option>
							<option value="3">수</option>
							<option value="4">목</option>
							<option value="5">금</option>
							<option value="6">토</option>
						</select>
					</li>
					<li>
						오픈시간
						<select name="p_open" class="p_open">
							<%
								for (int i = 0; i < 25; i++) {
							%>
							<option value="<%=i%>"><%=i%>시
							</option>
							<%
								}
							%>
						</select>
					</li>
					<li>
						마감시간
						<select name="p_close" class="p_close">
							<%
								for (int i = 0; i < 25; i++) {
							%>
							<option value="<%=i%>"><%=i%>시
							</option>
							<%
								}
							%>
						</select>
					</li>
					<li>
						구장 상태
						<c:choose>
							<c:when test="${p_status eq '0'}">
								<p>운영전</p>
							</c:when>
							<c:when test="${p_status eq '1'}">
								<p>운영중</p>
							</c:when>
						</c:choose>
						<select name="p_status" id="p_status">
							<option value="0" selected>운영상태 변경</option>
							<option value="1">운영중</option>
							<option value="2">임시휴업</option>
							<option value="3">폐업</option>
						</select>
						<div id="p_holidaydate" style="display: none">
							<input type="date" name="p_holiday_start" /> <input type="date"
								name="p_holiday_end" />
						</div>
					</li>
					<li>
						서류 제출 유형
						<c:choose>
							<c:when test="${p_file eq '1'}">
								<p>첨부파일 선택</p>
							</c:when>
							<c:when test="${p_file eq '2'}">
								<p>팩스 선택</p>
							</c:when>
							<c:when test="${p_file eq '3'}">
								<p>등기 선택</p>
							</c:when>
							<c:when test="${p_file eq '4'}">
								<p>메일 선택</p>
							</c:when>
						</c:choose>
					</li>
					<li>
						소개글
						<textarea rows="20" cols="50">${p_intro}</textarea>
					</li>
				</ul>
				<div>
					<input type="submit" value="수정하기">
					<input type="button" id="placeListBtn" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>