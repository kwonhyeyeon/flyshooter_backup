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
	$(document).ready(function() {
		$("#home").click(function() {
			location.href = "/";
		});
		errCodeCheck();
	});
	function errCodeCheck() {
		var errCode = '<c:out value = "${errCode}"/>';
		if (errCode != "") {
			//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("비밀번호 일치 하지않습니다. 다시 시도해 주세요.");
				return false;
			}
		}
	}
	$(function() {
		$("#gnb").hover(function() {
			$(".menu-wrap").slideDown(500);
		});
		$(".menu-wrap").mouseleave(function() {
			$(".menu-wrap").slideUp(500);
		});
	})
</script>

<body>
	<div>

		<div id="header-wrap">
			<jsp:include page="../templates/header.jsp" flush="true" />
		</div>

		<div class="sub-v"></div>

		<div id="contents">
			<form id="modifyForm" action="/member/mypage/modify.do" method="post">
				<div>
					<label for="pw">비밀 번호</label>
					<div>
						<input type="password" id="m_pw" name="m_pw" maxlength="15"
							placeholder="Password">
					</div>
				</div>
				<div>
					<input type="submit" value="확인" id="modifyForm" /> <input
						type="button" value="홈으로" id="home" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>