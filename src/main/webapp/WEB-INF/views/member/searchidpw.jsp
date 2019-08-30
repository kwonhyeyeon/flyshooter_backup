<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
</head>
<body>
	<div>
		<div>
			<form id="idsearch">
				ID찾기
				<div>
					<input type="radio" name="shooter" value="user" checked> 회원
           		    <input type="radio" name="shooter" value="member"> 사업자	
				</div>
				<div>
					<label for="m_name">이&nbsp;름</label>
					&nbsp;&nbsp; <input type="text" id="m_name" name="m_name">
				</div>
				<div>
					<label for="m_phone">핸드폰번호</label>
					&nbsp;&nbsp; <input type="text" id="m_phone" name="m_phone"> 
				</div>
				<div>
					<input type="button" value="찾기" id="idsearch"/>
					<input type="button" value="회원가입" id="joinBtn"/>
				</div>
			</form>
			<hr>
			<form id="pwsearch">
				PW찾기
				<div>
					<input type="radio" name="shooter" value="user" checked> 회원
           		    <input type="radio" name="shooter" value="member"> 사업자	
				</div>
				<div>
					<label for="m_id">아&nbsp;이&nbsp;디</label>
					&nbsp;&nbsp;<input type="email" id="m_id" name="m_id">
				</div>
				<div>
					<input type="button" value="PW찾기" id="pwsearch"/>
				</div>
			</form>
		</div>
	</div>
</body>
</html>