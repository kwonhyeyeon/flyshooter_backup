<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<title>Insert title here</title>
</head>
<body>
		<c:forEach var="term" items="${data}">
				<c:if test="${term.ctype == 2}">
					<div class="embed">${term.content}</div>
				</c:if>
			</c:forEach>
</body>
</html>