<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#home").click(function() {
			location.href = "/";
		});
	});
</script>
</head>
<body>

	<div id="wrapper">
	
		<header id="account-header">
			<h1><a href="/">FLY SHOOTER</a></h1>
		</header>
		
		<article id="account-contents">
		
			<div class="login-box">
				<c:if test="${not empty m_id }">
				<input type="text" value="${m_id }" readonly/>
				</c:if>
				
				<c:if test="${empty m_id }">
					<p class="refresh">아이디가 존재하지 않습니다</p>
				</c:if>
			</div>
			
			<a href="/member/login.do" class="activeBtn">로그인</a>
			
		</article>
		
		<footer id="account-footer">
			<div class="footer-link">
				<a href="/member/terms.do?type=termsUse" target="_blank">이용약관</a>
				<a href="/member/terms.do?type=sttmn" target="_blank">개인정보취급방침</a>
			</div>
			<p class="copyright">Copyright © <a class="link-home" href="/">FLYSHOOTER.</a> All rights reserved.</p>
		</footer>
		
	</div>
	
</body>
</html>