<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 용병지원 상세보기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#returnBtn").click(function() {
		location.href = "/admin/support/supportList.do";
	});
	
	$("#supportDeleteBtn").click(function() {
		var answer = confirm("삭제하시겠습니까?");
		if (answer == true) {
			$("#deleteId").attr({
				"method" : "get",
				"action" : "/admin/support/supportDelete.do"
			});

			$("#deleteId").submit();
		} else if (answer == false) {
			location.href = "/admin/support/supportList.do";
		}
		
	});

});
</script>

</head>
<body>

	<div id="supportModalDialog" class="supportModal" role="dialog">
		<div>
			<h2>용병지원 상세보기</h2>
		</div>
		
		<form id="deleteId" name="deleteId">
			<input type="hidden" name="hs_no" id="hs_no" value="${supportView.hs_no}">
		</form>
		
		<div>
			<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
		</div>

		<div class="supportContentView">
			<table border="1">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${supportView.m_name}</td>
						<th>지역</th>
						<td>${supportView.hs_area}</td>
					</tr>
					<tr>
						<th>가능시간</th>
						<td colspan="3">${supportView.hs_date} ${supportView.hs_time}</td>
					</tr>
					<tr>
						<th>인원 수</th>
						<td>${supportView.hs_people}</td>
						<th>팀 수준</th>
						<td><span class="statusText">
							<c:choose>
								<c:when test="${supportView.hs_level == '2'}">상</c:when>
								<c:when test="${supportView.hs_level == '1'}">중</c:when>
								<c:when test="${supportView.hs_level == '0'}">하</c:when>
							</c:choose>
						</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${supportView.hs_progress == '1'}">${supportView.m_phone}</c:when>
								<c:when test="${supportView.hs_progress == '0'}"> </c:when>
								<c:when test="${supportView.hs_progress == '-1'}"> </c:when>
							</c:choose>
						</td>
						<th>진행상태</th>
						<td><span class="supportStatus"> 
								<c:choose>
									<c:when test="${supportView.hs_progress == '1'}">가능</c:when>
									<c:when test="${supportView.hs_progress == '0'}">종료</c:when>
									<c:when test="${supportView.hs_progress == '-1'}">마감</c:when>
								</c:choose>
						</span></td>
					</tr>
					
					<tr>
						<td colspan="4">${supportView.hs_etc}</td>
					</tr>
				</tbody>
			</table>

			<div class="sUpdateBtn">
				<input type="button" value="삭제하기" name="supportDeleteBtn"
					id="supportDeleteBtn" width="100px" height="40px">
				<input type="button" value="돌아가기" name="returnBtn" id="returnBtn" width="100px" height="40px">
			</div>

		</div>

	</div>
</body>
</html>