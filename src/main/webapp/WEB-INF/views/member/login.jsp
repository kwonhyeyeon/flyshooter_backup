<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#loginForm").submit(function() {
			var id = $("#m_id").val();
			var pw = $("#m_pw").val();
			if (!(id)) {
				alert("아이디를 입력하세요");
				alert(id)
				return false;
			}
			if (!(pw)) {
				alert("비밀번호를 입력하세요");
				return false;
			}
		});
		errCodeCheck();
	});
	function errCodeCheck() {
		var errCode = '<c:out value = "${errCode}"/>';
		var retry = '<c:out value = "${retry}"/>';
		if (errCode != "") {
			//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요. ("
						+ retry + "/5회) 시도");
				return false;
			case 3:
				alert("회원 유형이 일치하지 않습니다.\n다시 시도해 주세요");
				return false;
			case 6:
				alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시  시도해 주세요");
				return false;
			case 9:
				alert("이메일 인증이 이루어져 있지 않습니다. \n이메일 인증을 해주세요.");
				return false;
			}
		}
	}
</script>
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
				<input type="email" id="m_id" name="m_id" placeholder="User ID" />
			</div>
		</div>
		<div>
			<label for="pw">비밀 번호</label>
			<div>
				<input type="password" id="m_pw" name="m_pw" placeholder="Password">
			</div>
			<p class="form-control-static error"></p>
		</div>
		<input type="submit" value="login" id="loginbutton" name="loginbutton" />
	</form>
</body>
</html>