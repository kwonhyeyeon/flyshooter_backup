<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 매치신청 상세보기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#returnBtn").click(function() {
		location.href = "/admin/match/matchList.do";
	});
	
	$("#matchDeleteBtn").click(function() {
		var answer = confirm("삭제하시겠습니까?");
		if (answer == true) {
			$("#deleteId").attr({
				"method" : "get",
				"action" : "/admin/match/matchDelete.do"
			});

			$("#deleteId").submit();
		} else if (answer == false) {
			location.href = "/admin/match/matchList.do";
		}
		
	});

});
</script>
</head>
<body>
	<div id="matchModalDialog" class="matchModal" role="dialog">
		<div>
			<h2>매치신청 상세보기</h2>
		</div>
		
		<form id="deleteId" name="deleteId">
			<input type="hidden" name="mb_no" id="mb_no" value="${matchView.mb_no}">
		</form>
		
		<div>
			<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
		</div>

		<div class="matchContentView">
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
						<td>${matchView.m_name}</td>
						<th>매치형태</th>
						<td>${matchView.mb_type}</td>
					</tr>
					<tr>
						<th>구장명</th>
						<td colspan="3">${matchView.mb_name}</td>
					</tr>
					<tr>
						<th>구장주소</th>
						<td colspan="3">${matchView.mb_address}</td>
					</tr>
					<tr>
						<th>경기장</th>
						<td colspan="3">${matchView.mb_stadium}</td>
					</tr>
					<tr>
						<th>매치일자</th>
						<td colspan="3">${matchView.mb_m_date} ${matchView.mb_time}</td>
					</tr>
					<tr>
						<th>유니폼</th>
						<td>
						<span class="statusText"> <c:choose>
									<c:when test="${matchView.mb_uniform == null}"></c:when>
									<c:when test="${matchView.mb_uniform != null}">${matchView.mb_uniform}</c:when>
								</c:choose>
						</span>
						</td>
						
						<th>팀 수준</th>
						<td><span class="statusText"> <c:choose>
									<c:when test="${matchView.mb_level == '2'}">상</c:when>
									<c:when test="${matchView.mb_level == '1'}">중</c:when>
									<c:when test="${matchView.mb_level == '0'}">하</c:when>
								</c:choose>
						</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${matchView.mb_progress == '1'}">${matchView.m_phone}</c:when>
								<c:when test="${matchView.mb_progress == '0'}"> </c:when>
								<c:when test="${matchView.mb_progress == '-1'}"> </c:when>
							</c:choose>
						</td>
						<th>신청여부</th>
						<td><span class="matchStatus"> 
								<c:choose>
									<c:when test="${matchView.mb_progress == '1'}">가능</c:when>
									<c:when test="${matchView.mb_progress == '0'}">종료</c:when>
									<c:when test="${matchView.mb_progress == '-1'}">마감</c:when>
								</c:choose>
						</span></td>
					</tr>
					<tr>
						<td colspan="4">${matchView.mb_etc}</td>
					</tr>
				</tbody>
			</table>

			<div class="mUpdateBtn">
				<input type="button" value="삭제하기" name="matchDeleteBtn"
					id="matchDeleteBtn" width="100px" height="40px">
				<input type="button" value="돌아가기" name="returnBtn" id="returnBtn" width="100px" height="40px">
			</div>

		</div>

	</div>
</body>
</html>