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
<script type="text/javascript" src="/resources/js/memberModify.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<body>

	<div id="wrapper">
	
		<jsp:include page="../templates/header.jsp" flush="true" />

		<article id="contents">
			<h2 class="articleTit">회원 정보 수정</h2>
			
			<div id="mypage-contents">
				<form id="modifyForm" action="/member/mypage/modify_success.do" method="post">
					<div class="login-box">
						<h3>
							아이디 (<c:if test="${mvo.m_type==1}">일반</c:if><c:if test="${mvo.m_type==0}">사업자</c:if>)
						</h3>
						<input type="email" id="m_id" name="m_id" value="${mvo.m_id }" readonly />
						
						<h3>비밀번호</h3>
						<input type="password" id="m_pw" name="m_pw">
						<h3>비밀번호 확인</h3>
						<input type="password" id="m_pwCheck" name="m_pwCheck">
						<p id="pwcheck" class="error"></p>
					</div>
					
					<div class="login-box">
						<h3>이름</h3>
						<input type="text" id="m_name" name="m_name" value="${mvo.m_name}">
						
						<h3>핸드폰 번호</h3>
						<div class="phoneArea">
							<input type="hidden" name="m_phone" id="m_phone"/>
							
							<select name="m_phone0" id="m_phone0">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="019">019</option>
							</select>
							
							<input type="text" id="m_phone1" name="m_phone1" value="${m_phone1}">
								
							<input type="text" id="m_phone2" name="m_phone2" value="${m_phone2}">
						</div>
					</div>
					
					<div class="btnArea">
						<button id="delete" class="cancle">회원 탈퇴</button>
						<button id="modifyInsert" class="active">확인</button>
					</div>	                
				</form>	
			</div>
			
		</article>
			
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
	
</body>
<script type="text/javascript">
	$(document).ready(function() {
	    $("#m_phone0").val('${m_phone0}');
	});
</script>
</html>