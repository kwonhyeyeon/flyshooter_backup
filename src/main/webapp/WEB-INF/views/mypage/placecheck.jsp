<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 구단등록 약관동의 페이지</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeCheck.js"></script>
</head>
<body>

	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">구장 등록</h2>
			
			<div class="input-custom all">
				<input type="checkbox" id="checkAll" onclick="cAll();">
				<label id="checkLabel" for="checkAll">이용약관, 개인정보 취급방침 모두 동의합니다</label>
			</div>
			
			<c:forEach var="term" items="${data}">
				<c:if test="${term.ctype == 1}">
					<div class="input-custom">
						<input type="checkbox" id="check1" />
						<label id="checkLabel" for="check1">이용약관 동의(필수)</label>
					</div>
						
					<div class="embed">${term.content}</div>
				</c:if>
				
				<c:if test="${term.ctype == 2}">
					<div class="input-custom">
						<input type="checkbox" id="check2" />
						<label id="checkLabel" for="check2">개인정보 취급방침 동의(필수)</label>
					</div>
						
					<div class="embed">${term.content}</div>
				</c:if>
			</c:forEach>
			
			<div class="btnArea">
				<a class="cancle" href="/mypage/placeList.do">취소</a>
				<a class="active" href="insertPlaceBtns">동의</a>
			</div>
			
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
</body>
</html>