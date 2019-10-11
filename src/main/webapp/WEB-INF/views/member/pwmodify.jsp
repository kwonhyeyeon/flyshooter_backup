<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FLY SHOOTER</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#modifyForm").submit(function() {
		return modifyCheck();
	});
	$("#m_pwCheck, #m_pw").blur(function() {
		var m_pw = $("#m_pw").val();
		var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
		var re3 =  /^[A-Za-z0-9]{6,12}$/;//패스워드 정규식(숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식

		if (!check(re, pw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		      return false;
		}
		if(!check(re3, pw, "숫자와 문자 포함 형태의 6~12자리 이내")){
			   return false;
		}
		   

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
</head>

<body>

	<div id="wrapper">
	
		<header id="account-header">
			<h1><a href="/">FLY SHOOTER</a></h1>
		</header>
		
		<article id="account-contents">
		
			<form id="modifyForm" action="/member/pwmodify.do" method="post">
				<input type="hidden" id="m_id" name="m_id" value="${m_id}" readonly />
			
				<div class="login-box">
				
					<input type="password" id="m_pw" name="m_pw" placeholder="비밀번호">
					
					<input type="password" id="m_pwCheck" name="m_pwCheck" placeholder="비밀번호 확인">
					<p id="pwcheck" class="error"></p>
					
				</div>
			
				<input type="submit" value="수정" id="pwmodify" class="activeBtn" />
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