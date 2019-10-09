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

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script>
$(document).ready(function(){ 
	
	if("${rental_message}"){
		alert("${rental_message}");
		location.href = "/user/rental/location.do";
	}
	
});
</script>
</head>
<body>

	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
		
			<h2 class="articleTit">지역 검색</h2>
			
			<form action="/user/rental/placeList.do" method="get">
			
				<div class="location">
					<input type="text" class="area" name="area" placeholder="지역명" />
					
					<%-- <c:if test="${not empty message }">
						<p>${message}</p>
					</c:if> --%>
					
					<input type="submit" value="검색" class="activeBtn" />
				</div>
				
			</form>
			
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
		
</body>
</html>