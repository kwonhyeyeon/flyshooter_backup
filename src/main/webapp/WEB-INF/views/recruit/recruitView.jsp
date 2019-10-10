<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>

	<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
	<input type="hidden" name="m_id" id="boardID" value="${recruitView.m_id}">
	<table class="detailTbl">
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
								<c:if test="${recruitView.hr_level == 2}">상</c:if>
								<c:if test="${recruitView.hr_level == 1}">중</c:if>
								<c:if test="${recruitView.hr_level == 0}">하</c:if>
						</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:if test="${recruitView.hr_progress == 1}">${recruitView.m_phone}</c:if>
							<c:if test="${recruitView.hr_progress == 0 || recruitView.hr_progress == -1}"> </c:if>
						</td>
						
						<th>진행상태</th>
						<td>
							<c:if test="${recruitView.hr_progress == 1}">가능</c:if>
							<c:if test="${recruitView.hr_progress == 0}">종료</c:if>
							<c:if test="${recruitView.hr_progress == -1}">마감</c:if>
						</td>
					</tr>
					
					<tr>
						<th>유니폼</th>
						<td colspan="3">
							<c:if test="${recruitView.hr_nuiform == null}"></c:if>
							<c:if test="${recruitView.hr_nuiform != null}">${recruitView.hr_nuiform}</c:if>
						</td>
					</tr>
					
					<tr>
						<td colspan="4">${recruitView.hr_etc}</td>
					</tr>
		</table>
</body>
</html>