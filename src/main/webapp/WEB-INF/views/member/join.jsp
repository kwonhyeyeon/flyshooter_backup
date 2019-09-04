<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Member!</title>
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/join.js"></script>
<body>
	<div>
		<form id="memberForm" action="/member/join.do" method="post">
			<div>
				<input type="radio" name="m_type" value="1" id="m_type" required/>일반 
				<input type="radio" name="m_type" value="0" id="m_type" required/>사업자
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
			<div>
				<label for="pwCheck">비밀번호 확인 </label>
				<div>
					<input type="password" id="m_pwCheck" name="m_pwCheck"
						maxlength="15" placeholder="Password Confirm"> <span
						id="pwcheck"></span>
				</div>
			</div>
			<div>
				<label for="userName">회원이름</label>
				<div>
					<input type="text" id="m_name" name="m_name" maxlength="10"
						placeholder="NAME">
				</div>
			</div>
			<div>
				<label for="phone">핸드폰번호 </label>
				<div>
					<input type="text" id="m_phone" name="m_phone" maxlength="15"
						placeholder="Phone Number">
				</div>
			</div>
			<div>
				<div>
					<input type="submit" value="확인" id="joinInsert" /> 
					<input type="reset" value="재작성" id="joinReset" /> <input type="button"
						value="홈으로" id="joinCancel" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>