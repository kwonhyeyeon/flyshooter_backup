<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FLY SHOOTER</title>

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker -->
<script type="text/javascript" src="/resources/js/rentalList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>
	<div id="wrapper">

		<div id="header-wrap">
			<jsp:include page="../templates/header.jsp" flush="true" />
		</div>
		
		<div class="sub-v"></div>
		
		<article id="contents">
			<!-- 구장명, 날짜 선택 -->
			<div class="placeList">
				<c:choose>
					<c:when test="${not empty placeList}">
						<select name="placeName" class="placeName" id="placeName">
							<c:forEach var="place" items="${placeList}" varStatus="status">
								<option class="placeName-op" value="${place.p_num}">${place.p_name}</option>
							</c:forEach>
						</select>
					</c:when>
					
					<c:otherwise>
						<select name="placeName" class="placeName">
							<option class="placeName-op" selected>구장 없음</option>
						</select>
					</c:otherwise>
				</c:choose>
				
				<input type="text" id="datepicker" />
			</div>
			<!-- 구장명, 날짜 선택 -->
			
			<!-- 경기장 별 대관 예약 리스트 -->
			<div class="stadiumList">
			</div>
			<!-- 경기장 별 대관 예약 리스트 -->
			
			<!-- 대관 상세페이지 (모달창) -->
			<div id="dialog" class="rentalDetail" style="display: none">
			
			</div>
			<!-- 대관 상세페이지 (모달창) -->
		</article>
		
	</div>
		
</body>
</html>