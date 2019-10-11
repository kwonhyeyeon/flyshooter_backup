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

<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/stats.js"></script>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);


google.charts.load('current', {'packages':['bar']});
google.charts.setOnLoadCallback(drawChart);

	function sendParam(){
		var param = "${statisics}";
		
		var p_rep1 = param.replace("[","");
		var p_rep2 = p_rep1.replace("]","");
		
		return p_rep2;
	}
	
	function sendIndex(){
		return "${cnt}";
	}
	
	function sendYear(){
		return "${selectYear}";
	}
	
		
</script>
</head>
<body>
	<div id="wrapper">
	
		<jsp:include page="../templates/header.jsp" flush="true" />
	
		<article id="contents">
		
			<h2 class="articleTit">통계</h2>
			
			<div class="notice">
				<p><span class="red">※ 등록된 구장중 가장 오래된 대관연도부터 최근 대관연도까지 조회 가능합니다</span></p>
			</div>
		
			<div class="selectArea">
				<select id="placeBox" name="placeBox" >
					<option>전체 구장</option>
					<c:forEach var="pvo" items="${place}">
						<option value="${ pvo.p_num }">${ pvo.p_name }</option>
					</c:forEach>	
				</select>
				
				<select id="year">
					<c:forEach var="year" items="${years }">
						<option value="${year }">${year }</option>
					</c:forEach> 
				</select>
			</div>
			
			<section class="itemArea">
			
				<div id="tab-wrapper">
				    <ul class="tabs">
				        <li class="active insub" rel="tab1">대관건수</li>
				        <li class="insub" rel="tab2">매출</li>
				    </ul>
				    <div class="tab-container">
				        <div id="tab1" class="tab-content"><div id="line_top_x"></div></div>
				        <!-- #tab1 -->
				        <div id="tab2" class="tab-content"><div id="columnchart_material"></div></div>
				        <!-- #tab2 -->
				    </div>
	  				  <!-- .tab_container -->
				</div>
			
			</section>
		
		</article>


		<form id="search">
			<input type="hidden" name="year" id="selectedYear"/>
		</form>

		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
</body>
</html>