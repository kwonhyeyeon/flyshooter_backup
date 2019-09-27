<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/resources/css/reset.css" />
<link rel="stylesheet"  href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>

	<div id="wrapper">
	
		<div id="header-wrap">
			<jsp:include page="../templates/header.jsp" flush="true" />
		</div>
		
		<div class="sub-v"></div>
		
		<!-- 상세 페이지 이동을 위한 form -->
		<form id="rentalInsertForm">
		      <input type="hidden" name="p_num" id="p_num">
		</form>
		
		<article id="contents">
			
			<h2>대관 가능한 구장</h2>
			
			<table>
				<colgroup>
					<col width="10%" />
					<col width="62%" />
					<col width="15%" />
					<col width="13%" />
				</colgroup>
				<tr>
					<th>구장명</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>운영시간</th>
				</tr>
				
				<c:choose>
					<c:when test="${ not empty searchPlaceList }" >
						<c:forEach var="place" items="${ searchPlaceList }" varStatus="status">
							<tr data-num="${ place.p_num }" class="goRental">
								<td>${ place.p_name }</td>
								<td>${ place.p_address }</td>
								<td>${ place.p_phone }</td>
								<td>${ place.p_open } ~ ${ place.p_close }(시)</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">검색된 지역에는 등록된 구장이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			
		</article>
	
	</div>

</body>
</html>