<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<label for="id">ID</label>
		<div>
			<input type="text" value="${m_id }" readonly/>
		</div>
		<input type="button" value="홈으로" id="home" name="home" />
	</div>
</body>
</html>