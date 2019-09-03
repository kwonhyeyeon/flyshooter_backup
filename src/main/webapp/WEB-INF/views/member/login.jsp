<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
</head>
<body>
	<form id="loginForm" action="/member/login.do" method="post">
		<div>
			<input type="radio" name="m_type" value="1" id="m_type" required />일반
			<input type="radio" name="m_type" value="0" id="m_type" required />사업자
		</div>
		<div>
			<label for="id">ID</label>
			<div>
				<input type="email" id="m_id" name="m_id" placeholder="User ID" /><span
					id="idcheck"> </span>
			</div>
		</div>
		<div>
			<label for="pw">비밀 번호</label>
			<div>
				<input type="password" id="m_pw" name="m_pw" maxlength="15"
					placeholder="Password">
			</div>
		</div>
		<input type="submit" value="login" id="loginbutton" name="loginbutton"/>
	</form>
</body>
</html>