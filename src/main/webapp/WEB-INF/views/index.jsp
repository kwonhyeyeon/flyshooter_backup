<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
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
<%
	String m_id = "";

	m_id = (String) session.getAttribute("m_id"); // request에서 id 파라미터를 가져온다
%>


<body>
	<div id="wrapper">
		<div id="main-v"></div>
		<div id="main-wrap">
			<header id="main">
				<nav id="main-lnb">
					<%
						if (m_id == null) {
					%>
					<ul>
						<li><a href="/member/join.do">회원가입</a></li>
						<li><a href="/member/login.do">로그인</a></li>
					</ul>


					<%
						} else {
					%>
					<ul>
						<li><a href="/member/logout.do">로그아웃</a></li>
					</ul>
					<%
						}
					%>

				</nav>

				<h1>FLY SHOOTER</h1>

				<nav id="main-gnb">
					<ul>
						<li><a href="/user/rental/location.do">대관</a></li>
						<li><a href="/">매치</a></li>
						<li><a href="/">용병</a></li>
						<li><a href="/">마이페이지</a></li>
					</ul>
				</nav>
			</header>
		</div>

	</div>

</body>
</html>