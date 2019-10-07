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
	<input type="hidden" name="m_id" id="boardID" value="${supportView.m_id}">
	<table class="detailTbl">
		<tr>
			<th>작성자</th>
			<td>${supportView.m_name}</td>
			
			<th>지역</th>
			<td>${supportView.hs_area}</td>
		</tr>
		<tr>
			<th>가능시간</th>
			<td colspan="3">${supportView.hs_date} ${supportView.hs_time}</td>
		</tr>
		<tr>
			<th>인원 수</th>
			<td>${supportView.hs_people}</td>
			
			<th>팀 수준</th>
			<td>
				<c:if test="${supportView.hs_level == 2}">상</c:if>
				<c:if test="${supportView.hs_level == 1}">중</c:if>
				<c:if test="${supportView.hs_level == 0}">하</c:if>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<c:if test="${supportView.hs_progress == 1}">${supportView.m_phone}</c:if>
				<c:if test="${supportView.hs_progress == 0 || supportView.hs_progress == -1}"></c:if>
			</td>
			<th>진행상태</th>
			<td>
				<c:if test="${supportView.hs_progress == 1}">가능</c:if>
				<c:if test="${supportView.hs_progress == 0}">종료</c:if>
				<c:if test="${supportView.hs_progress == -1}">마감</c:if>
			</td>
		</tr>

		<tr>
			<td colspan="4">${supportView.hs_etc}</td>
		</tr>
	</table>

</body>
</html>