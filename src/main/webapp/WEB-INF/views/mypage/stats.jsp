<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장/구장 페이지</title>
<script src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript" src="/resources/js/stats.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>


</head>
<body>
	<div id="wrapper">
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
		<div id="graph">
			<!-- Content -->
			<p>구장 선택해주세요</p>
		</div>
		<h4>사이트 방문자 성별 현황 그래프</h4>

		<div id="Line_Controls_Chart" >
			<!-- 라인 차트 생성할 영역 -->
			<div id="lineChartArea" style="padding: 0px 20px 0px 0px;"></div>
			<!-- 컨트롤바를 생성할 영역 -->
			<div id="controlsArea" style="padding: 0px 20px 0px 0px;"></div>
		</div>



	</div>
</body>



</html>