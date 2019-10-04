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
	<input type="hidden" name="m_id" id="boardID" value="${matchView.m_id}">
	<table class="detailTbl">
		<tr>
			<th>작성자</th>
			<td>${matchView.m_name}</td>
			<th>매치 형태</th>
			<td>${matchView.mb_type}</td>
		</tr>
		<tr>
			<th>구장명</th>
			<td colspan="3">${matchView.mb_name}</td>
		</tr>
		<tr>
			<th>구장 주소</th>
			<td colspan="3">${matchView.mb_address}</td>
		</tr>
		<tr>
			<th>경기장</th>
			<td colspan="3">${matchView.mb_stadium}</td>
		</tr>
		<tr>
			<th>매치일자</th>
			<td colspan="3">${matchView.mb_m_date} ${matchView.mb_time}</td>
		</tr>
		<tr>
			<th>유니폼</th>
			<td>
				<c:if test="${matchView.mb_uniform == null}">없음</c:if>
				<c:if test="${matchView.mb_uniform != null}">${matchView.mb_uniform}</c:if>
			</td>
			<th>팀 수준</th>
			<td>
				<c:if test="${matchView.mb_level == 2}">상</c:if>
				<c:if test="${matchView.mb_level == 1}">중</c:if>
				<c:if test="${matchView.mb_level == 0}">하</c:if>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<c:if test="${matchView.mb_progress == 1}">${matchView.m_phone}</c:if>
				<c:if test="${matchView.mb_progress == 0 || matchView.mb_progress == -1}"></c:if>
			</td>
			<th>신청 여부</th>
			<td>
				<c:if test="${matchView.mb_progress == 1}">가능</c:if>
				<c:if test="${matchView.mb_progress == 0}">종료</c:if>
				<c:if test="${matchView.mb_progress == -1}">마감</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">${matchView.mb_etc}</td>
		</tr>
	</table>

</body>
</html>