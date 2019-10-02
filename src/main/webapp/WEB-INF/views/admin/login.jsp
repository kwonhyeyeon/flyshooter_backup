<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/adminLogin.js"></script>
<script type="text/javascript">
		window.history.forward();

		function noBack() {
			window.history.forward();
		}
		
		if("${log_message}"){
			alert("${log_message}");
			location.href = "/admin/login.do";
	}
		
		if("${adminId}"){
			location.href = "/admin/main.do";
	}

</script>
</head>
<body>

	<div id="wrapper">
		
		<div id="header-wrap">
            <div id="header">
                <h1 id="logo"><a href="/admin/login.do">FLY SHOOTER 관리자</a></h1>
                <c:if test="${not empty adminId}">
                	<a href="/admin/logout.do" class="logout">로그아웃</a>
                </c:if>
            </div><!-- header -->
        </div><!-- header-wrap -->
	
		<div id="content-wrap">
			<div id="container">
				<article class="loginArea">
					<c:if test="${empty adminId}">
					    <form action="/admin/login.do" method="post">
					        <fieldset>
					            <h2 class="login-title">로그인</h2>
					            
					            <table class="loginTable">
					            	<tr>
										<td>아이디</td>
										<td><input type="text" name="adminId" id="adminId" /></td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td><input type="password" name="adminPw" id="adminPw" required /></td>
									</tr>
					            </table>
					            
					            <div>
					                <p class="error_msg"></p><!-- error_txt -->
					            </div>
					
					            <button type="submit" class="login">로그인</button>
					        </fieldset>
						</form>
					</c:if>
				</article><!-- login -->
			</div>
		</div>
	
	</div>	
</body>
</html>