<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<body>
	
	<div id="wrapper" class="account">
	
		<header id="account-header">
			<h1>FLY SHOOTER</h1>
		</header>
		
		<article id="account-contents">
			<c:forEach var="term" items="${data}">
				<c:if test="${term.ctype == 1}">
					<div class="term_check">
						<input type="checkbox" id="agree" />
						<label for="agree">이용약관 동의(필수)</label>
					</div>
						
					<div class="embed">${term.content}</div>
				</c:if>
				
				<c:if test="${term.ctype == 2}">
					<div class="term_check">
						<input type="checkbox" id="privacy" />
						<label for="privacy">개인정보 취급방침(필수)</label>
					</div>
						
					<div class="embed">${term.content}</div>
				</c:if>
			</c:forEach>
			
			<form id="agreeForm" action="/member/join.do" method="get">
				<input type="reset" value="취소" id="" />
				<input type="submit" value="확인" id="goJoin" /> 
			</form>	
		</article>
		
	</div>

</body>
</html>