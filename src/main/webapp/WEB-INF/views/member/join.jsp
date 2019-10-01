<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Member!</title>
</head>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/join.js"></script>
<body>

	<div id="wrapper">
	
		<header id="account-header">
			<h1><a href="/">FLY SHOOTER</a></h1>
		</header>
		
		<article id="account-contents">
			<form id="memberForm" action="/member/join.do" method="post">
				<div class="input-custom">
					<div class="radio-box">
						<input type="radio" name="m_type" value="1" id="user" required />
						<label for="user">일반</label>
						<span class="radio-check"></span>
					</div>
					
					<div class="radio-box">
						<input type="radio" name="m_type" value="0" id="client" required />
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
						<select name="m_phone1" id="m_phone1">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
						</select>
						
						<input type="text" id="m_phone2" name="m_phone2" maxlength="4"
							placeholder="Phone Number">
							
						<input type="text" id="m_phone3" name="m_phone3" maxlength="4"
							placeholder="Phone Number">
							
						<input type="hidden" name="m_phone" id="m_phone"/>
					</div>
				</div>
				
				<div class="btnArea">
					<input type="submit" value="확인" id="joinInsert" /> 
					<input type="reset" value="재작성" id="joinReset" /> 
					<input type="button" value="홈으로" id="home" />
				</div>
			</form>
		</article>
		
	</div>
</body>
</html>