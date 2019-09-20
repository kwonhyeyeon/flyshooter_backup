<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 용병 모집 상세보기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#returnBtn").click(function() {
		location.href = "/admin/recruit/recruitList.do";
	});
	
	$("#recruitDeleteBtn").click(function() {
		var answer = confirm("삭제하시겠습니까?");
		if (answer == true) {
			$("#deleteId").attr({
				"method" : "get",
				"action" : "/admin/recruit/recruitDelete.do"
			});

			$("#deleteId").submit();
		} else if (answer == false) {
			location.href = "/admin/recruit/recruitList.do";
		}
		
	});

});
</script>
</head>
<body>
	
	<div id="recruitModalDialog" class="recruitModal" role="dialog">
		<div>
			<h2>용병 모집 상세보기</h2>
		</div>
		
		<form id="deleteId" name="deleteId">
			<input type="hidden" name="hr_no" id="hr_no" value="${recruitView.hr_no}">
		</form>
		
		<div>
			<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
		</div>

		<div class="recruitContentView">
			<table border="1">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${recruitView.m_name}</td>
						<th>매치형태</th>
						<td>${recruitView.hr_m_type}</td>
					</tr>
					<tr>
						<th>구장명</th>
						<td colspan="3">${recruitView.hr_name}</td>
					</tr>
					<tr>
						<th>구장주소</th>
						<td colspan="3">${recruitView.hr_address}</td>
					</tr>
					<tr>
						<th>경기장</th>
						<td colspan="3">${recruitView.hr_stadium}</td>
					</tr>
					<tr>
						<th>매치일자</th>
						<td colspan="3">${recruitView.hr_m_date} ${recruitView.hr_time}</td>
					</tr>
					
					<tr>
						<th>모집인원</th>
						<td>${recruitView.hr_people}</td>
						
						<th>팀 수준</th>
						<td><span class="statusText">
							<c:choose>
								<c:when test="${recruitView.hr_level == '2'}">상</c:when>
								<c:when test="${recruitView.hr_level == '1'}">중</c:when>
								<c:when test="${recruitView.hr_level == '0'}">하</c:when>
							</c:choose>
						</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${recruitView.hr_progress == '1'}">${recruitView.m_phone}</c:when>
								<c:when test="${recruitView.hr_progress == '0'}"> </c:when>
								<c:when test="${recruitView.hr_progress == '-1'}"> </c:when>
							</c:choose>
						</td>
						
						<th>진행상태</th>
						<td><span class="recruitStatus"> 
								<c:choose>
									<c:when test="${recruitView.hr_progress == '1'}">가능</c:when>
									<c:when test="${recruitView.hr_progress == '0'}">종료</c:when>
									<c:when test="${recruitView.hr_progress == '-1'}">마감</c:when>
								</c:choose>
						</span></td>
					</tr>
					
					<tr>
						<th>유니폼</th>
						<td colspan="3">
						<span class="statusText"> <c:choose>
									<c:when test="${recruitView.hr_nuiform == null}"></c:when>
									<c:when test="${recruitView.hr_nuiform != null}">${recruitView.hr_nuiform}</c:when>
								</c:choose>
						</span>
						</td>
					</tr>
					
					<tr>
						<td colspan="4">${recruitView.hr_etc}</td>
					</tr>
				</tbody>
			</table>

			<div class="rUpdateBtn">
				<input type="button" value="삭제하기" name="recruitDeleteBtn"
					id="recruitDeleteBtn" width="100px" height="40px">
				<input type="button" value="돌아가기" name="returnBtn" id="returnBtn" width="100px" height="40px">
			</div>

		</div>

	</div>
</body>
</html>