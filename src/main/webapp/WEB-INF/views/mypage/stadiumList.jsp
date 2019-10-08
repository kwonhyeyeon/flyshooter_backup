<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script type="text/javascript" src="/resources/js/stadiumList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>

	<div id="wrapper">
	
		<jsp:include page="../templates/header.jsp" flush="true" />
	
		<article id="contents">
			<h2 class="articleTit">경기장 / 용품</h2>
			
			<section class="itemArea">
				
				<div class="notice">
					<span class="red">* 주의사항 *</span>
					<p>1. 승인되지 않은 구장은 사용할 수 없습니다</p>
					<p>2. 승인이 되더라도 구장 운영 상태를 운영중으로 수정하지 않을 시 사용자가 대관을 할 수 없으니 <span class="red">필히</span> 수정 바랍니다</p>
					<p>3. Fly Shooter에 해가 되는 구장(불법 구장) 및 해가 되는 행위는 최대 구장 강제 페쇄 조치까지 이를 수 있습니다</p>
				</div>
				
				<div class="selectArea">
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
							<select name="placeChoice" class="placeChoice">
								<option class="placeName-op" selected>구장 없음</option>
							</select>
						</c:otherwise>
					</c:choose>
				</div>
				
				<c:choose>
					<c:when test="${not empty placeChoice}">
						<div id="tab-wrapper">
						
							<ul class="tabs">
								<li><a href="#tabS">경기장</a></li>
								<li><a href="#tabI">용품</a></li>
							</ul>
							
							<form id="datailForm" action="/mypage/stadiumDetail.do"method="post">
								<input type="hidden" name="s_no" id="s_no">
							</form>
							<div id="List" class="tab-container">
								<p class="noItem">구장을 선택해주세요</p>
							</div>
							
						</div>
					</c:when>
					
					<c:otherwise>
						<p class="noItem">등록된 구장이 없습니다</p>
							
						<div class="btnArea">
							<button id="placeInsert" class="active">구장 등록</button>
						</div>
					</c:otherwise>
				</c:choose>
				
				<div id="dialog">
					<form id="itemInsertForm">
				      	<input type="hidden" id="modalP_num" name="p_num"/>
				        <label>용품명<input type="text" id="modalI_name" name="i_name" /></label><br />
				        <label>가 격<input type="text" id="modalI_rental_fee" name="i_rental_fee" /></label>
				      </form>  
				</div>

			</section>
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
	
	</div>
</body>
</html>