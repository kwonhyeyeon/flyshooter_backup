<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병 모집 상세보기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	// 수정 페이지 이동  스크립트
	// 버튼 클릭 시 등록된 글의 내용을 DB에서 불러옴
	$(function() {
		var boardID = "${recruitView.m_id}";
		
		var id = "";
		id += $("#m_id").val();
		
		$(document).on('click', '#updateBtn', function() {
			if (id != "" && id == boardID) {
				var url = "${pagecontext.request.contextpath}/recruit/recruitUpdateForm.do";
				url = url + "?hr_no=" + ${recruitView.hr_no};
				location.href = url;
			} else if (id == "") {
				alert("로그인 후 수정 할 수 있습니다.");
				location.href = "/recruit/recruitList.do";
			} else if ( id != boardID) {
				alert("다른 회원의 글은 수정 할 수 없습니다.")
				location.href = "/recruit/recruitList.do";
			}
		});
		
		$("#returnBtn").click(function() {
			location.href = "/recruit/recruitList.do";
		});
	});
</script>
</head>
<body>

	<div id="modaldialog" class="modaldialog" role="dialog">
		<div id="viewTitle">
			<h2>용병모집 상세보기</h2>
		</div>
		
		<div>
			<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
		</div>

		<div class="contentView">
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
						<td>${recruitView.m_name}</td>
						<th>매치형태</th>
						<td>${recruitView.hr_m_type}</td>
					</tr>
					<tr>
						<th>구장명</th>
						<td colspan="3">${recruitView.hr_name}</td>
					</tr>
					<tr>
						<th>구장주소</th>
						<td colspan="3">${recruitView.hr_address}</td>
					</tr>
					<tr>
						<th>경기장</th>
						<td colspan="3">${recruitView.hr_stadium}</td>
					</tr>
					<tr>
						<th>매치일자</th>
						<td colspan="3">${recruitView.hr_m_date} ${recruitView.hr_time}</td>
					</tr>
					
					<tr>
						<th>모집인원</th>
						<td>${recruitView.hr_people}</td>
						
						<th>팀 수준</th>
						<td><span class="statusText">
							<c:choose>
								<c:when test="${recruitView.hr_level == '2'}">상</c:when>
								<c:when test="${recruitView.hr_level == '1'}">중</c:when>
								<c:when test="${recruitView.hr_level == '0'}">하</c:when>
							</c:choose>
						</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${recruitView.hr_progress == '1'}">${recruitView.m_phone}</c:when>
								<c:when test="${recruitView.hr_progress == '0'}"> </c:when>
								<c:when test="${recruitView.hr_progress == '-1'}"> </c:when>
							</c:choose>
						</td>
						
						<th>진행상태</th>
						<td><span class="statusView"> 
								<c:choose>
									<c:when test="${recruitView.hr_progress == '1'}">가능</c:when>
									<c:when test="${recruitView.hr_progress == '0'}">종료</c:when>
									<c:when test="${recruitView.hr_progress == '-1'}">마감</c:when>
								</c:choose>
						</span></td>
					</tr>
					
					<tr>
						<th>유니폼</th>
						<td colspan="3">
						<span> <c:choose>
									<c:when test="${recruitView.hr_nuiform == null}"></c:when>
									<c:when test="${recruitView.hr_nuiform != null}">${recruitView.hr_nuiform}</c:when>
								</c:choose>
						</span>
						</td>
					</tr>
					
					<tr>
						<td colspan="4">${recruitView.hr_etc}</td>
					</tr>
				</tbody>
			</table>

			<div class="updateButton">
				<input type="button" value="수정하기" name="updateBtn" id="updateBtn">
				<input type="button" value="목록" name="returnBtn" id="returnBtn">
			</div>

		</div>

	</div>
</body>
</html>