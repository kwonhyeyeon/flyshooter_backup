<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장/구장 페이지</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/toggle.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script type="text/javascript" src="/resources/js/stadiumList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>

	<div id="header-wrap">
		<jsp:include page="../templates/header.jsp" flush="true" />
	</div>

	<div class="sub-v"></div>

	<div id="contents">
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
		<div id="dialog" title="용품등록창" style="display: none">
	      <form id="itemInsertForm">
	      	<input type="hidden" id="modalP_num" name="p_num"/>
	        <label>용품 명<input type="text" id="modalI_name" name="i_name" /></label><br />
	        <label>가 격<input type="text" id="modalI_rental_fee" name="i_rental_fee" /></label>
	      </form>   
		</div>
	</div>
</body>
</html>