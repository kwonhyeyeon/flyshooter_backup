<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 등록</title>
</head>
<script type="text/javascript">
	
</script>
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
			<form id="p_placeForm" action="/mypage/placeInsert.do" method="post">
				<div class="p_name">구장명</div>
				<div>
					<input type="text" value="${p_name}">
				</div>
				<div class="p_ceo">대표자명</div>
				<div>
					<input type="text" value="${p_ceo}">
				</div>
				<div class="p_num">사업자번호</div>
				<div>
					<input type="text" value="${p_num}">
				</div>
				<div class="p_phone">구장전화번호</div>
				<div>
					<input type="text" value="${p_phone}">
				</div>
				<div class="p_address">구장 주소</div>
				<div>${p_address }</div>
				<div>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<br> <input type="text" id="sample6_address" placeholder="주소">
					<br> <input type="text" id="sample6_detailAddress"
						placeholder="상세주소"> <br> <input type="text"
						id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<div>
					<input type="button" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기">
				</div>
				<div class="p_bank">은행명</div>
				<div>
					<select name="p_bank">
						<option selected>${p_bank }</option>
					</select>
				</div>
				<div class="p_account">
					예금주명&nbsp;<input type="text" value="${p_account }">
				</div>
				<div class="p_account_num">입금계좌번호</div>
				<div>
					<input type="text" value="${p_account_num}">
				</div>
				<div class="p_holiday">정기휴일</div>
				<div>
					<select class="p_holiday" name="p_holiday">
						<option value="0">일</option>
						<option value="1">월</option>
						<option value="2">화</option>
						<option value="3">수</option>
						<option value="4">목</option>
						<option value="5">금</option>
						<option value="6">토</option>
					</select>
				</div>
				<div class="p_open">오픈시간</div>
				<div>
					<div>${p_open }</div>
					<select name="p_open" class="p_open">
						<%
							for (int i = 1; i < 25; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="p_close">마감시간</div>
				<div>
					<select name="p_close" class="p_close">
						<%
							for (int i = 1; i < 25; i++) {
						%>
						<option value="<%=i%>"><%=i%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="p_status">구장 상태</div>
				<div>
					<c:choose>
						<c:when test="${p_status eq '0'}">
							<p>운영전</p>
						</c:when>
						<c:when test="${p_status eq '1'}">
							<p>운영중</p>
						</c:when>
					</c:choose>
					<select name="p_status">
						<option value="4" selected>운영상태 변경</option>
						<option value="1">운영중</option>
						<option value="2">임시휴업</option>
						<option value="3">폐업</option>
					</select>
				</div>

				<div class="p_file">서류 제출 유형</div>
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
				<div class="p_intro">소개글</div>
				<div>
					<textarea rows="20" cols="50">${p_intro}</textarea>
				</div>
				<div>
					<input type="button" id="placeListBtn" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
</html>