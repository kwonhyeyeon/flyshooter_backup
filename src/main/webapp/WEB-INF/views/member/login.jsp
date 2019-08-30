<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/login.js" ></script>
</head>
<body>
<div class="contentainner">
<div class="well">
	<c:if test="${login.m_id == null or login.m_pw == ''}">
		<form id ="loginForm" class="form-horizontal">
			<div class="form-group">
			<input type="radio" name="shooter" value="user" checked> 회원
            <input type="radio" name="shooter" value="member"> 사업자	
			</div>
			<div class="form-group">
				<label for="m_id" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-4">
					<input type="email" id="m_id" name="m_id" class="form-control" placeholder="ID">
				</div>
				<p class="form-control-static error"></p>
			</div>
			<div class="form-group">
				<label for="m_pw" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" id="m_pw" name="m_pw" class="form-control" placeholder="Password">
				</div>
				<p class="form-control-static error"></p>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="로그인" id="loginBtn" class="btn btn-default"/>
						<input type="button" value="ID/PW찾기" id="searchIdPw" class="btn btn-default "/>
						<input type="button" value="회원가입" id="joinBtn" class="btn btn-default"/>
					</div>
				</div>
		</form>
	</c:if>
	
	<!-- 로그인 성공했을때 -->
	<c:if test="${login.m_id != null and login.m_id != ''}">
		<fieldset id="loginAfter">
			<legend><strong>[${login.m_name}]님 반갑습니다.</strong></legend>
			<span id ="memberMenu" class="tac">
				<a href="/memeber/logout.do">로그아웃</a>
				&nbsp;&nbsp;&nbsp;
				<a href="/member/modify.do">정보수정</a>
				&nbsp;&nbsp;&nbsp;
				<a href="/member/delete.do">회원탈퇴</a>
			</span>
		</fieldset>
	</c:if>
</div>
</div>

</body>
</html>