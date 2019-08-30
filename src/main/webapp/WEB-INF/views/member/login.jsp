<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<div class="contentainner">
<div class="well">
	<c:if test="${login.m_id == null or login.m_pw == ''}">
		<form id ="loginForm" class="form-horizontal">
			<div class="form-group">
				<label for="m_id" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-4">
					<input type="text" id="m_id" name="m_id" class="form-control" placeholder="ID">
				</div>
				<p class="form-control-static error"></p>
			</div>
			<div class="form-group">
				<label for="m_pw" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" id="m_pw" name="m_pw" class="form-control" placeholder="Password">
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="로그인" id="loginBtn" class="btn btn-default"/>
						<input type="button" value="ID/PW찾기" id="searchIdPw" class="btn btn-default "/>
						<input type="button" value="회원가입" id="joinBtn" class="btn btn-default"/>
					</div>
				</div>
			</div>
		</form>
	</c:if>
</div>
</div>

</body>
</html>