<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FLY SHOOTER</title>

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#modifyForm").submit(function() {
		return modifyCheck();
	});
	$("#m_pwCheck, #m_pw").blur(function() {
		var m_pw = $("#m_pw").val();

		var pwcheck = document.getElementById("pwcheck");

		if ($("#m_pw").val() != $("#m_pwCheck").val()) {
			pwcheck.innerHTML = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
			pwcheck.style.color = "red";
			$("#m_pwCheck").val("");
			pwConfirm = 1;
			return false;
		} else {
			pwcheck.innerHTML = " ";
			pwConfirm = 2;
			return true;
		}

	});
	errCodeCheck();
});
function errCodeCheck() {
	var errCode = '<c:out value = "${errCode}"/>';
	if (errCode != "") {
		//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
		switch (parseInt(errCode)) {
		case 1:
			alert("페이지에 오류가 발생하였습니다. 다시 시도해 주세요. ");
			return false;
		}
	}
}

</script>
<body>
	<form id="modifyForm" action="/member/pwmodify.do"
		method="post">
		<div>
			<input type="hidden" id="m_id" name="m_id" value="${m_id }" readonly />
		</div>
		<div>
			<label for="pw">비밀 번호</label>
			<div>
				<input type="password" id="m_pw" name="m_pw" maxlength="15" value="">
			</div>
		</div>
		<div>
			<label for="pwCheck">비밀번호 확인 </label>
			<div>
				<input type="password" id="m_pwCheck" name="m_pwCheck"
					maxlength="15" value=""> <span id="pwcheck"></span>
			</div>
		</div>
		
		<div>
			<div>
				<input type="submit" value="수정" id="pwmodify" />
			</div>
		</div>
	</form>
</body>
</html>