<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
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
<script type="text/javascript" src="/resources/js/offlineRegister.js"></script>
<!-- datepicker -->
<script>

	$(function() {
		$("#gnb").hover(function() {
			$(".menu-wrap").slideDown(500);
		});
		$(".menu-wrap").mouseleave(function() {
			$(".menu-wrap").slideUp(500);
		});
	})
	
</script>
</head>
<body>
	<div id="wrapper">

		<div id="header-wrap">
			<jsp:include page="../templates/header.jsp" flush="true" />
		</div>
		
		<div class="sub-v"></div>
		
		<article class="offlineRental">
			
			<section class="offlineCal">
				<h1>오프라인 대관 등록</h1>
				<hr />
				
				<section> 
				
					<section class="placeSelectBox">
					
						<label><input type="text" id="datepicker" placeholder="예약일자"/></label>
						
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
					</section>
					
					<section class="stadiumSelectBox">
						<p>※경기장을 선택하면 대관가능한 시간대를 보여줍니다.</p>
					
						<select id="stadiumSelectBox" name="selectStadium" >
							<option value="">경기장선택</option>
							<c:forEach var="stadium" items="${ stadiumList }">
								<option value="${ stadium.s_no }">${ stadium.s_name }</option>
							</c:forEach>	
						</select>	
					</section>
					
				</section>
				
				<!-- 대관가능한 시간리스트 비동기로 append예정 -->
				<section id="selectTime">
					
				</section>
			</section>
		</article>
		
	</div>
		
</body>
</html>