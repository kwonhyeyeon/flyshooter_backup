<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/tiny.js"></script>
<body>

	<h1>FLY SHOOTER</h1>
	
	<div>
		<input type="checkbox" name="agree" id="agree" />
		<label for="agree">이용약관 동의(필수)</label>
		
		<textarea name="content" id="agreeTerms"></textarea>
	</div>
	
	<div>
		<input type="checkbox" name=privacy id="privacy" />
		<label for="privacy">개인정보 취급방침(필수)</label>
		
		<textarea name="privacyTerms" id="privacyTerms"></textarea>
	</div>
	
	<form id="agreeForm" action="/member/join.do" method="get">
		<input type="reset" value="취소" id="" />
		<input type="submit" value="확인" id="goJoin" /> 
	</form>

</body>
</html>