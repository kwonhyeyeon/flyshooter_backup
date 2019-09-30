<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeList.js"></script>
<script>
$(document).ready(function() {
	var errCode = "${errCode}";
	//에러코드 검사
	//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
	if (parseInt(errCode) == 1) {
		alert("페이지에 오류가 발생하였습니다. \n잠시 후 다시 시도해 주세요");
		return false;
	}
});

</script>
</head>
<body>

	<div id="header-wrap">
		<jsp:include page="../templates/header.jsp" flush="true" />
	</div>

	<div class="sub-v"></div>

	<div id="contents">
		<div class="contentTit">
			<h3>구장 리스트</h3>
		</div>

		<%--==상세 페이지 이동을 위한 FORM --%>
		<form id="datailForm" action="/mypage/placeDetail.do" method="post">
			<input type="hidden" name="p_num" id="p_num">
		</form>

		<%-- ==구장리스트== --%>
		<div id="placeList">

			<table>
				<tr>
					<th>사업자번호</th>
					<th>구장명</th>
					<th>대표자명</th>
					<th>구장 주소</th>
					<th>구장 전화번호</th>
					<th>승인 상태</th>
				</tr>
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty placeList}">
						<c:forEach var="place" items="${placeList}" varStatus="status">
							<tr class="placeList" data-num="${place.p_num}">
								<td>${place.p_num}</td>
								<!-- p_name 클릭시 상세보기(수정) -->
								<td class="detailPage">${place.p_name}</td>
								<td>${place.p_ceo}</td>
								<td>${place.p_address}</td>
								<td>${place.p_phone}</td>
								<td>${place.p_ok}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<!-- 등록된 구장이 존재하지 않을때 표시되는 글-->
							<td colspan="1" class="tac">등록된 구장이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
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