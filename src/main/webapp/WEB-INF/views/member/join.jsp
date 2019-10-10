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
<script type="text/javascript" src="/resources/js/join.js"></script>
</head>

<body>

	<div id="wrapper">
	
		<header id="account-header">
			<h1><a href="/">FLY SHOOTER</a></h1>
		</header>
		
		<article id="account-contents">
		
			<form id="memberForm" action="/member/join.do" method="post">
				<div class="input-custom">
					<div class="radio-box">
						<input type="radio" name="m_type" value="1" id="user" />
						<label for="user">일반</label>
						<span class="radio-check"></span>
					</div>
					
					<div class="radio-box">
						<input type="radio" name="m_type" value="0" id="client" />
						<label for="client">사업자</label>
						<span class="radio-check"></span>
					</div>
				</div>
				
				<div class="login-box">
					<input type="email" id="m_id" name="m_id" placeholder="아이디" />
					<p id="idcheck" class="error"></p>
					
					<input type="password" id="m_pw" name="m_pw" placeholder="비밀번호">
					
					<input type="password" id="m_pwCheck" name="m_pwCheck" placeholder="비밀번호 확인">
					<p id="pwcheck" class="error"></p>
				</div>
				
				<div class="login-box">
					<input type="text" id="m_name" name="m_name" placeholder="이름">
					
					<div class="phoneArea">
						<input type="hidden" name="m_phone" id="m_phone"/>
						
						<select name="m_phone1" id="m_phone1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
						</select>
						
						<input type="text" id="m_phone2" name="m_phone2" placeholder="전화번호">
							
						<input type="text" id="m_phone3" name="m_phone3" placeholder="전화번호">
					</div>
				</div>
				
				<input type="submit" value="가입하기" id="joinInsert" class="activeBtn" /> 
			</form>
			
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