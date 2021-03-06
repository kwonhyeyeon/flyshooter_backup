<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>

</head>
<body>
	
	<div id="wrapper">
	
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">나의 구장</h2>
	
			<%--==상세 페이지 이동을 위한 FORM --%>
			<form id="datailForm">
				<input type="hidden" name="p_num" id="p_num">
			</form>
			
			<div class="insertArea">
				<input type="button" value="구장 등록" id="insertPlaceBtn" class="insertBtn">
			</div>
			
			<section class="itemArea">
			
				<table class="listTbl">
					<tr class="bgTr">
						<th>사업자번호</th>
						<th>구장명</th>
						<th>대표자명</th>
						<th>구장 주소</th>
						<th>구장 전화번호</th>
						<th>승인 상태</th>
					</tr>
					<c:choose>
						<c:when test="${not empty placeList}">
							<c:forEach var="place" items="${placeList}" varStatus="status">
								<tr class="detailPage goDetail" data-num="${place.p_num}">
									<td>${place.p_num}</td>
									<td>${place.p_name}</td>
									<td>${place.p_ceo}</td>
									<td>${place.p_address}</td>
									<td>${place.p_phone}</td>
									<td>
									<c:if test="${place.p_ok eq 0}">
									승인 대기
									</c:if>
									<c:if test="${place.p_ok eq 1}">
									승인 완료
									</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<!-- 등록된 구장이 존재하지 않을때 표시되는 글-->
								<td colspan="6">등록된 구장이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			
			</section>

		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
	
	</div>
	
</body>

<script>
$(document).ready(function() {
	var errCode = "${errCode}";
	//에러코드 검사
	//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
	if (parseInt(errCode) == 1) {
		alert("페이지에 오류가 발생하였습니다. \n잠시 후 다시 시도해 주세요");
		return false;
	}
	
	if( "${message}" ){
		alert("${message}");
		location.href = "./placeList.do";	
	}
});
</script>

</html>