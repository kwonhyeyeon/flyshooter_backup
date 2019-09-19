<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장/구장 페이지</title>
<link rel="stylesheet" href="/resources/css/toggle.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/stadiumList.js"></script>
</head>
<body>
	<div id="wrapper">
		<ul class="tabs">
			<li><a href="#tab1">경기장</a></li>
			<li><a href="#tab2">용품</a></li>
		</ul>
		<div>
			<c:choose>
				<c:when test="${not empty placeChoice}">
					<select name="placeChoice" id="placeChoice">
						<option selected value="선택">구장 선택</option>
						<c:forEach var="place" items="${placeChoice}">
							<option value="${place.p_num}">${place.p_name}</option>
						</c:forEach>
					</select>
				</c:when>
				<c:otherwise>
					<p>등록된 구장이 존재하지 않습니다.</p>
						<input type="button" value="구장 등록" id="placeInsert">
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 탭 콘텐츠 영역 -->
		<div class="tab_container">
		
			<form id="datailForm" action="/mypage/stadiumDetail.do"method="post">
				<input type="hidden" name="s_no" id="s_no">
			</form>
			<div id="List">
				<!-- Content -->
				<p>구장을 선택해주세요</p>
			</div>
		</div>
	</div>
</body>
</html>