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
<script type="text/javascript" src="/resources/js/modify.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<body>
	<div>
	
		
		<div id="header-wrap">
			<jsp:include page="../templates/header.jsp" flush="true" />
		</div>

		<div class="sub-v"></div>

		<div id="contents">
			<form id="modifyForm" action="/member/mypage/modify_success.do" method="post">
				<div>
					<c:if test="${mvo.m_type=='1'}">
						<input type="radio" name="m_type" value="1" id="m_type" checked readonly/>일반 
					</c:if>
					<c:if test="${mvo.m_type=='0'}">
						<input type="radio" name="m_type" value="0" id="m_type" checked readonly/>사업자
					</c:if>
				</div>
				<div>
					<label for="id">ID</label>
					<div>
						<input type="email" id="m_id" name="m_id" value="${mvo.m_id }" readonly/>
					</div>
				</div>
				<div>
					<label for="pw">비밀 번호</label>
					<div>
						<input type="password" id="m_pw" name="m_pw" maxlength="15"
							value="">
					</div>
				</div>
				<div>
					<label for="pwCheck">비밀번호 확인 </label>
					<div>
						<input type="password" id="m_pwCheck" name="m_pwCheck"
							maxlength="15" value=""> <span
							id="pwcheck"></span>
					</div>
				</div>
				<div>
					<label for="userName">회원이름</label>
					<div>
						<input type="text" id="m_name" name="m_name" maxlength="10"
							value="${m_name }">
					</div>
				</div>
				<div>
					<label for="phone">핸드폰번호 </label>
					<div>
						<input type="text" id="m_phone" name="m_phone" maxlength="15"
							value="${m_phone }">
					</div>
				</div>
				<div>
					<div>
						<input type="submit" value="확인" id="modifyInsert" /> 
						<input type="button" value="회원탈퇴" id="delete" /> 
						<input type="button" value="홈으로" id="home" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>