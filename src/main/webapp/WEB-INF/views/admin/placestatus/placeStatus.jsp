<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 구장 등록 현황</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- end datepicker -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var dateInfo = [];
		var registerInfo = [];

		<c:forEach var="adminstatus" items="${selectPlace}">
		dateInfo.push('${adminstatus.p_ok_date}');
		</c:forEach>

		<c:forEach var="adminstatus" items="${selectPlace}">
		registerInfo.push('${adminstatus.count}');
		</c:forEach>

		var dataRows = [ [ '날짜', {
			label : "등록수",
			type : "number"
		} ] ];

		for (var i = 0; i < registerInfo.length; i++) {
			dataRows.push([ dateInfo[i], registerInfo[i] ]);
		}

		var data = new google.visualization.arrayToDataTable(dataRows);

		var options = {
			chart : {
				title : '구장 등록 현황 통계',
				subtitle : '통계 그래프',
			},
			width : 900,
			height : 500
		};

		var chart = new google.charts.Line(document
				.getElementById('linechart_material'));

		chart.draw(data, google.charts.Line.convertOptions(options));
	}
</script>

</head>
<body>

	<div id="wrapper">
		<div id="header-wrap">
			<div id="header">
				<h1 id="logo">
					<a href="/admin/main.do">FLY SHOOTER 관리자</a>
				</h1>
				<c:if test="${not empty adminId}">
					<a href="/admin/logout.do" class="logout">로그아웃</a>
				</c:if>
			</div>
			<!-- header -->
		</div>
		<!-- header-wrap -->

		<div id="content-wrap">
			<aside id="subNavi">
				<jsp:include page="../templates/subNavi.jsp" flush="true" />
			</aside>
			<!-- subNavi -->

			<div id="container">
				<article id="contents">

					<div id="linechart_material"></div>

				</article>
				<!-- contents -->
			</div>
			<!-- container -->
		</div>
		<!-- con_wrap -->
	</div>

</body>
</html>