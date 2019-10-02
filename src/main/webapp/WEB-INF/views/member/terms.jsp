<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeCheck.js"></script>
</head>

<body>
	
	<div id="wrapper">
	
		<header id="account-header">
			<h1><a href="/">FLY SHOOTER</a></h1>
		</header>
		
		<article id="account-contents">
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
			
			<form id="agreeForm" action="/member/join.do" method="get">
				<a href="/">취소</a>
				<input type="submit" value="확인" id="goJoin" /> 
			</form>	
		</article>
		
		<footer id="account-footer">
			<div class="footer-link">
				<a href="">이용약관</a>
				<a href="">개인정보취급방침</a>
			</div>
			<p class="copyright">Copyright © <a class="link-home" href="/">FLYSHOOTER.</a> All rights reserved.</p>
		</footer>
		
	</div>

</body>
</html>