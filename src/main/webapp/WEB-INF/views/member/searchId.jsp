<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#home").click(function() {
			location.href = "/";
		});
	});
</script>
</head>
<body>
	<div>
		<div>
			<c:if test="${not empty m_id }">
				<label for="id">ID</label>
				<input type="text" value="${m_id }" readonly/>
			</c:if>
			<c:if test="${empty m_id }">
				<p>존재하지 않는 아이디 정보 입니다.</p>
			</c:if>
		</div>
		<input type="button" value="홈으로" id="home" name="home" />
	</div>
</body>
</html>