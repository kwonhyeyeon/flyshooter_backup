<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="5; url=/member/login.do">
<title>FLY SHOOTER</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
</head>
<body>

	<div id="wrapper">
	
		<header id="account-header">
			<h1><a href="/">FLY SHOOTER</a></h1>
		</header>
		
		<article id="account-contents">
		
			<p class="refresh">
				입력하신 ID(이메일)로 인증 메일을 발송했습니다<br>
				이메일 인증 후 서비스를 이용하실 수 있습니다<br /> 
				5초 후에 로그인 화면으로 이동합니다
			</p>	
			
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