<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FLY SHOOTER</title>
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
   $(function() {
      $("#gnb").hover(function() {
         $(".menu-wrap").slideDown(500);
      });
      $(".menu-wrap").mouseleave(function() {
         $(".menu-wrap").slideUp(500);
      });
   })
</script>
</head>
<body>

	<div id="wrapper">

		<div id="header-wrap">
			<header id="header">
				<h1><a href="/">FLY SHOOTER</a></h1>
				
				<nav id="gnb">
					<ul>
						<li><a href="/">대관</a></li>
						<li><a href="/">매치</a></li>
						<li><a href="/">용병</a></li>
						<li><a href="/">마이페이지</a></li>
					</ul>
				</nav>
				
				<nav id="lnb">
					<ul>
						<li><a href="/">회원가입</a></li>
						<li><a href="/">로그인</a></li>
						
						<li><a href="/">로그아웃</a></li>
					</ul>
				</nav>
			</header>
		</div>
		
		<div class="sub-v"></div>
		
		<div class="location-wrap">
			<form action="/rental/placeList.do" method="get">
				<table border="1">
					<tr>
						<td>지역검색</td>
					</tr>
					
					<tr>
						<td><input type="text" name="area" /></td>
					</tr>
					
					<c:if test="${not empty message }">
						<tr>
							<td><span style="color: red">${message }</span></td>
						</tr>
					</c:if>
					
					<tr>
						<td><input type="submit" /></td>
					</tr>
				</table>
			</form>
		</div>
		
	</div>
		
</body>
</html>