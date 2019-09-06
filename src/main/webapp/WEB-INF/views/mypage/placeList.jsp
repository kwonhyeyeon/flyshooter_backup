<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeList.js"></script>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3>구장 리스트</h3></div>
		
	<%--==상세 페이지 이동을 위한 FORM --%>
	<form name="datailForm" id="detailForm">
		<input type="hidden" name="p_num" id="p_num">
	</form>	
	
 <%-- ==구장리스트== --%>
 	<div id="placeList">
 		<table summary="구장 리스트">
 			<colgroup>
 				<col width="10%"/>
 				<col width="10%"/>
 				<col width="10%"/>
 				<col width="34%"/>
 				<col width="20%"/>
 				<col width="5%"/>
 			</colgroup>
 			<thead>
 				<tr>
 					<th>사업자번호</th>
 					<th>구장명 </th>
 					<th>대표자명</th>
 					<th>구장 주소</th>
 					<th>구장 전화번호</th>
 					<th>승인 상태</th>
 				</tr>
 			</thead>
 			<tbody id="placeList">
 				<!-- 데이터 출력 -->
 				<c:choose>
 					<c:when test="${not empty placeList}">
 						<c:forEach var="place" items="${placeList}" varStatus="status">
 							<tr class="placeList" data-num="${place.p_num}">
 							<td id="detailPage">${place.p_num}</td>
 							<td>${place.p_name}</td>
 							<td>${place.p_ceo}</td>
 							<td>${place.p_address}</td>
 							<td>${place.p_phone}</td>
 							<td>${place.p_ok}</td>
 							</tr>
 						</c:forEach>
 					</c:when>
 					<c:otherwise>
 						<tr>
 							<td colspan="4" class="tac">등록된 구장이 존재하지 않습니다.</td>
 						</tr>
 					</c:otherwise>
 				</c:choose>
 			</tbody>
 		</table>
 	</div>
 	 <%-- ==구장리스트 종료== --%>
 	 
 	 <%--==구장등록 버튼== --%>
 	 <div class="placeBtn">
 	 	<input type="button" value="구장 등록" id="insertPlaceBtn">
 	 </div>
 	  <%--== 구장등록 버튼 출력 종료== --%>
 	  </div>
</body>
</html>