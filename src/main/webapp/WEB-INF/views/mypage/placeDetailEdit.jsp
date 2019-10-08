<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />

<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/placeDetailEdit.js"></script>
<!-- 다음 우편 주소 api-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

	<div id="wrapper">
		
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">${pvo.p_name} 구장 정보</h2>
			
			<section class="itemArea">
				
				<form id="p_placeModifyForm" action="/mypage/placeModify.do" method="post">
				
					<table class="detailTbl">
						<tr>
							<th>구장명</th>
							<td><input type="text" value="${pvo.p_name}" name="p_name" id="p_name" /></td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td><input type="text" value="${pvo.p_ceo}" name="p_ceo" id="p_ceo" /></td>
						</tr>
						<tr>
							<th>사업자번호</th>
							<td><input type="text" value="${pvo.p_num}" name="p_num" id="p_num" readonly /></td>
						</tr>
						<tr>
							<th>구장 전화번호</th>
							<td><input type="text" value="${pvo.p_phone}" name="p_phone" id="p_phone" /></td>
						</tr>
						<tr>
							<th>구장 주소</th>
							<td>
								<input type="hidden" name="p_address" id="p_address" />
								<section class="postArea">
									<input type="text" id="sample6_postcode" class="post" value="${sample6_postcode }" placeholder="우편번호" />
									<input type="button" onclick="sample6_execDaumPostcode()" class="postBtn" value="우편번호 찾기">
								</section>
								
								<section class="adrsArea">
									<input type="text" id="sample6_address" value="${sample6_address }" placeholder="주소">
									<input type="text" id="sample6_detailAddress" value="${sample6_detailAddress }" placeholder="상세 주소">
									<input type="text" id="sample6_extraAddress" value="${sample6_extraAddress }" placeholder="참고 항목">
								</section>
							</td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>은행명</th>
							<td>
								<select name="p_bank" id="p_bank">
									<option value="신한">신한</option>
									<option value="우리">우리</option>
									<option value="농협">농협</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>예금주명</th>
							<td><input type="text" value="${pvo.p_account}" name="p_account" id="p_account"></td>
						</tr>
						<tr>
							<th>입금 계좌번호</th>
							<td><input type="text" value="${pvo.p_account_num}" name="p_account_num" id="p_account_num" /></td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>정기 휴일</th>
							<td>
								<select class="p_holiday" name="p_holiday" id="p_holiday">
									<option value="0">일</option>
									<option value="1">월</option>
									<option value="2">화</option>
									<option value="3">수</option>
									<option value="4">목</option>
									<option value="5">금</option>
									<option value="6">토</option>
									<option value="7">연중무휴</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>오픈 시간</th>
							<td>
								<select name="p_open" class="p_open" id="p_open">
									<%
										for (int i = 1; i < 25; i++) {
									%>
									<option value="<%=i%>"><%=i%>시</option>
									<%
										}
									%>
								</select>
							</td>
						</tr>
						<tr>
							<th>마감 시간</th>
							<td>
								<select name="p_close" class="p_close" id="p_close">
									<%
										for (int i = 1; i < 25; i++) {
									%>
									<option value="<%=i%>"><%=i%>시</option>
									<%
										}
									%>
								</select>
							</td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>구장 상태</th>
							<td>
								<select name="p_status" id="p_status" id="p_status">
									<option value="0" disabled>운영전</option>
									<option value="1">운영중</option>
									<option value="2">임시휴업</option>
									<option value="3">폐업</option>
								</select>
								<p id="closePlace" class="error"></p>
							</td>
						</tr>
						<tr>
							<th>서류 제출 유형</th>
							<td>
								<c:choose>
									<c:when test="${pvo.p_file eq '1'}">첨부파일</c:when>
									<c:when test="${pvo.p_file eq '2'}">팩스</c:when>
									<c:when test="${pvo.p_file eq '3'}">등기</c:when>
									<c:when test="${pvo.p_file eq '4'}">메일</c:when>
								</c:choose>
							</td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>소개글</th>
							<td><textarea name="p_intro" id="p_intro">${pvo.p_intro}</textarea></td>
						</tr>
					</table>
					
					<div class="tblBtnArea space-between">
						<a href="/mypage/placeList.do" id="placeListBtn">목록</a>
						<input type="submit" class="modify" value="수정하기"> 
					</div>
				
				</form>
			
			</section>
			
		</article>
			
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
	
</body>
<script>
	$(document).ready(function() {
		$(".p_holiday").val('${pvo.p_holiday}');
		$(".p_open").val('${pvo.p_open}');
		$(".p_close").val('${pvo.p_close}');
		$(".p_status").val('${pvo.p_status}');
		$("#p_bank").val('${pvo.p_bank}');
	});
</script>
</html>