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
<script type="text/javascript" src="/resources/js/common.js"></script>

<body>

	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />

		<article id="contents">
			<h2 class="articleTit">회원 정보 수정</h2>
		
			<form id="modifyLoginForm" action="/member/mypage/modify.do" method="post">
				<div id="mypage-contents">
					
					<div class="login-box">
						<input type="password" id="m_pw" name="m_pw" placeholder="비밀번호">
					</div>
					
					<input type="submit" value="확인" id="modifyForm" class="activeBtn" />
					
				</div>
			</form>
		</article>
			
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
	
</body>

<script>
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
</script>

</html>