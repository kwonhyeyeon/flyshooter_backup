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
<script src="http://code.jquery.com/jquery.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script type="text/javascript" src="/resources/js/rentalList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">예약 현황</h2>
			
			<!-- 구장명, 날짜 선택 -->
			<div class="selectArea">
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
				
				<input type="text" id="datepicker" class="calendar" />
			</div>
			<!-- 구장명, 날짜 선택 -->
			
			<section id="itemArea">
				<p class="infotext">※ 온라인 예약일 경우 환불 요청 / 오프라인 대관일 경우 예약 취소 기능만 이용하실 수 있습니다.</p>
				<p class="infotext">※ 리스트 클릭 시 상세 정보를 확인할 수 있습니다.</p>
				
				<!-- 경기장 별 대관 예약 리스트 -->
				<div class="stadiumList"></div>
				<!-- 경기장 별 대관 예약 리스트 -->
				
				<!-- 대관 상세페이지 (모달창) -->
				<div id="dialog" class="rentalDetail"></div>
				<!-- 대관 상세페이지 (모달창) -->
			</section>
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
		
</body>
</html>