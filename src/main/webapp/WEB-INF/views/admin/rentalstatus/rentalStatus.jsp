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
<title>관리자 월별 예약 현황</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/adminStyle.css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- end datepicker -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/js/adminplacestatus.js"></script>

<script type="text/javascript">
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);


function sendParam(){
	var param = "${selectRental}";
	
	var p_rep1 = param.replace("[","");
	var p_rep2 = p_rep1.replace("]","");
	
	return p_rep2;
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

					<div id="line_top_x"></div>
				</article>
				<!-- contents -->
			</div>
			<!-- container -->
		</div>
		<!-- con_wrap -->
	</div>

</body>
</html>