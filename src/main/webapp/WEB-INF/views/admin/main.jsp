<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<script type="text/javascript">

		window.history.forward();

		function noBack() {
			window.history.forward();
		}
</script>
</head>
<body>


<div class="contents">
	<c:if test="${empty adminId}">
	<form action="/admin/main.do" method="POST">
			<table>
				<tr>
					<td colspan="3"><h2>관리자 로그인</h2></td> 
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="adminId" /></td>
					<td rowspan="2"><input type="submit" value="로그인"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="adminPw" /></td>
				</tr>
			</table>
		</form>
	</c:if>
	
	<c:if test="${not empty adminId}">
			 <h2>관리자로그인</h2>
			 
	</c:if>
</div>	
</body>
</html>