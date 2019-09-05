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
<body>
	<div id="wrapper">
		<div id="main-v"></div>
		<div id="main-wrap">
			<header id="main">
				<nav id="main-lnb">
					<ul>
						<c:if test="${empty m_id}">
							<li><a href="/member/join.do">회원가입</a></li>
							<li><a href="/member/login.do">로그인</a></li>
						</c:if>
						<c:if test="${not empty m_id}">
							<li><a href="/member/logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</nav>

				<h1>FLY SHOOTER</h1>
				<nav id="main-gnb">
					<ul>
						<c:if test="${empty m_id || m_type=='1'}">
							<li><a href="/user/rental/location.do">대관</a></li>
							<li><a href="/">매치</a></li>
							<li><a href="/">용병</a></li>
							<li><a href="/member/mypage/modifyLogin.do">마이페이지</a></li>
						</c:if>
						<c:if test="${m_type=='0'}">
							<li><a href="/client/rental/rentalList.do">대관</a></li>
							<li><a href="/">매치</a></li>
							<li><a href="/">용병</a></li>
							<li><a href="/member/mypage/modifyLogin.do">마이페이지</a></li>
						</c:if>
					</ul>
				</nav>

			</header>
		</div>

	</div>

</body>
</html>