<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Member!</title>
</head>
<body>
	<div>
		<div>
			<form id="memberForm">
				<div>
					<input type="radio" id="m_type" name="m_type" value="1"/>일반
					<input type="radio"  id="m_type" name="m_type" value="0"/>사업자
				</div>
				<div>
					<label for="userId">ID</label>
					<div>
						<input type="email" id="m_id" name="m_id" placeholder="User ID" />
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPw">비밀 번호</label>
					<div class="col-sm-3">
						<input type="password" id="m_pw" name="m_pw" maxlength="15" 
						placeholder="Password">
					</div>
				</div>
				<div>
					<label for="m_pwCheck">비밀번호 확인 </label>
					<div>
						<input type="password" id="m_pwCheck" name="m_pwCheck"
							maxlength="15" placeholder="Password Confirm">
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
						<input type="text" id="phone" name="phone" maxlength="15"
						placeholder="Phone Number">
					</div>
				</div>
				<div>
					<div>
						<input type="button" value="확인" id="joinInsert"/> 
						<input type="button" value="재작성"id="joinReset"/> 
						<input type="button" value="취소" id="joinCancel"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>