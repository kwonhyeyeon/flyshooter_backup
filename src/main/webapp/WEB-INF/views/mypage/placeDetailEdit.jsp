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
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/placeDetailEdit.js"></script>
<!-- 다음 우편 주소 api-->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$(".p_holiday").val('${pvo.p_holiday}');
		$(".p_open").val('${pvo.p_open}');
		$(".p_close").val('${pvo.p_close}');
		$(".p_status").val('${pvo.p_status}');
		$("#p_bank").val('${pvo.p_bank}');
	});
</script>
</head>
<body>

	<div id="header-wrap">
		<jsp:include page="../templates/header.jsp" flush="true" />
	</div>

	<div class="sub-v"></div>

	<article id="contents">
		<h3>${pvo.p_name}</h3>
		<div class="contentTB">
			<form id="p_placeModifyForm" action="/mypage/placeModify.do"
				method="post">
				<ul>
					<li>구장명 <input type="text" value="${pvo.p_name}" name="p_name"
						id="p_name">
					</li>
					<li>대표자명 <input type="text" value="${pvo.p_ceo}" name="p_ceo"
						id="p_ceo">
					</li>
					<li>사업자번호 <input type="text" value="${pvo.p_num}" name="p_num"
						id="p_num" readonly>
					</li>
					<li>구장전화번호 <input type="text" value="${pvo.p_phone}"
						name="p_phone" id="p_phone">
					</li>
					<li>구장 주소 <input type="text" id="sample6_postcode"
						value="${sample6_postcode }" placeholder="우편번호"> <br>
						<input type="text" id="sample6_address"
						value="${sample6_address }" placeholder="주소"> <br> <input
						type="text" id="sample6_detailAddress"
						value="${sample6_detailAddress }" placeholder="상세주소"> <br>
						<input type="text" id="sample6_extraAddress"
						value="${sample6_extraAddress }" placeholder="참고항목"> <input
						type="hidden" name="p_address" id="p_address" /> <input
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</li>
					<li>은행명
					<select name="p_bank" id="p_bank">
							<option value="신한">신한</option>
							<option value="우리">우리</option>
							<option value="농협">농협</option>
					<%-- 	<c:if test="${pvo.p_bank eq '신한'}">
							<option value="신한" selected>신한</option>
							<option value="우리">우리</option>
							<option value="농협">농협</option>
						</c:if>
						<c:if test="${pvo.p_bank eq '우리'}">
							<option value="신한" selected>신한</option>
							<option value="우리">우리</option>
							<option value="농협">농협</option>
						</c:if>
						<c:if test="${pvo.p_bank eq '농협'}">
							<option value="신한" selected>신한</option>
							<option value="우리">우리</option>
							<option value="농협">농협</option>
						</c:if> --%>
					</select>
					</li>
					<li>예금주명 <input type="text" value="${pvo.p_account }"
						name="p_account" id="p_account">
					</li>
					<li>입금계좌번호 <input type="text" value="${pvo.p_account_num}"
						name="p_account_num" id="p_account_num">
					</li>
					<li>정기휴일 <select class="p_holiday" name="p_holiday"
						id="p_holiday">
							<option value="0">일</option>
							<option value="1">월</option>
							<option value="2">화</option>
							<option value="3">수</option>
							<option value="4">목</option>
							<option value="5">금</option>
							<option value="6">토</option>
							<option value="7">연중무휴</option>
					</select>
					</li>
					<li>오픈시간 <select name="p_open" class="p_open" id="p_open">
							<%
								for (int i = 1; i < 25; i++) {
							%>
							<option value="<%=i%>"><%=i%>시
							</option>
							<%
								}
							%>
					</select>
					</li>
					<li>마감시간 <select name="p_close" class="p_close" id="p_close">
							<%
								for (int i = 1; i < 25; i++) {
							%>
							<option value="<%=i%>"><%=i%>시
							</option>
							<%
								}
							%>
					</select>
					</li>
					<li>구장 상태
					<select name="p_status" id="p_status" id="p_status">
							<option value="1">운영중</option>
							<option value="2">임시휴업</option>
							<option value="3">폐업</option>
					</select>
						<div id="p_holidaydate" style="display: none">
							<input type="date" name="p_holiday_start" id="p_holiday_start" value="${pvo.p_holiday_start}"/>
							<input type="date" name="p_holiday_end" id="p_holiday_end" value="${pvo.p_holiday_end}"/>
						</div> <span id="closePlace"></span>
					</li>
					<li>서류 제출 유형 <c:choose>
							<c:when test="${pvo.p_file eq '1'}">
								<p>첨부파일 선택</p>
							</c:when>
							<c:when test="${pvo.p_file eq '2'}">
								<p>팩스 선택</p>
							</c:when>
							<c:when test="${pvo.p_file eq '3'}">
								<p>등기 선택</p>
							</c:when>
							<c:when test="${pvo.p_file eq '4'}">
								<p>메일 선택</p>
							</c:when>
						</c:choose>
					</li>
					<li>소개글 <textarea rows="20" cols="50" name="p_intro"
							id="p_intro">${pvo.p_intro}</textarea>
					</li>
				</ul>
				<div>
					<input type="submit" value="수정하기"> <input type="button"
						id="placeListBtn" value="목록">
				</div>
			</form>
		</div>
	</article>
		
	<jsp:include page="../templates/footer.jsp" flush="true" />
	
</body>
</html>