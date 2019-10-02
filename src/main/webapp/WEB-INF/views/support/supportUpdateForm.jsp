<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병지원 수정</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui.min.css" />

<script src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var hs_date = $("#hs_date").datepicker({
			dateFormat : 'yy-mm-dd',
			buttonImage: "/application/db/jquery/images/calendar.gif",
			buttonImageOnly: true
		});
		//-------------------------------------------------
		
		//------연락처 자르기 자바 스크립트------------------------
		var phone = "${updateSupportData.m_phone}";
		var m_phone = phone.split('-');
		
		var p1 = m_phone[0];
		var p2 = m_phone[1];
		var p3 = m_phone[2];
		
		$(function() {
			$("#m_phone1").val(p1);
		});		
		$(function() {
			$("#m_phone2").val(p2);
		});		
		$(function() {
			$("#m_phone3").val(p3);
		});		
		//-------------------------------------------------
		
		// select box 데이터 가져오는 스크립트------------------------------
		$("#hs_level").val("${updateSupportData.hs_level}");
		$("#hs_progress").val("${updateSupportData.hs_progress}");
		$("#hs_people").val("${updateSupportData.hs_people}");
		//------------------------------------------------------------

		// 수정하기 버튼 이벤트 -------------------------------
		$("#updateDataBtn").click(
				function() {
					
					// 입력값 체크
					if (!chkSubmit($('#hs_area'), "지역을")) {
						return;
					} else if (!chkSubmit($('#hs_time'), "경기시간을")) {
						return;
					} else if (!chkSubmit($('#hs_people'), "인원수를")) {
						return;
					} else if (!chkSubmit($('#hs_level'), "팀 수준을")) {
						return;
					} else {
						$("#supportUpdateData").attr({
							"method" : "POST",
							"action" : "/support/supportUpdate.do"
						});
						
						$("#supportUpdateData").submit();
					}
					
				});
		
		// 취소 버튼 클릭 시 새로고침
		$("#cancel").click(function() {
			location.href = "/support/supportList.do";
		});
	});
	//--------종료-------------------------------------
</script>

</head>
<body>

<div id="wrapper">
		<jsp:include page="../templates/header.jsp" flush="true" />
		<article id="contents">
			<div id="updateData" style="width: 1200px;">
		<div id="updateTitle">
			<h2>용병지원(수정)</h2>
		</div>

		<form id="supportUpdateData" name="supportUpdateData">
			<input type="hidden" id="hs_no" name="hs_no"
				value="${updateSupportData.hs_no}" />
			<table class="updateTable">
				<!--<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup> -->

				<tbody>
					<tr>
						<td><label>신청자명<br />
						<input type="text" id="m_name" name="m_name" value=" ${updateSupportData.m_name}" disabled>
						</label></td>

						<td>연락처<br /> 
							<input type="text" name="m_phone1" id="m_phone1" disabled />
							<input type="text" name="m_phone2" id="m_phone2" disabled />
							<input type="text" name="m_phone3" id="m_phone3" disabled />
						</td>
					</tr>

					<tr>
						
						<td><label>지역<br />
								<input type="text" name="hs_area" id="hs_area" value="${updateSupportData.hs_area}">
						</label></td>
						
						<td><label>가능시간<br /> <input type="text"
								name="hs_date" id="hs_date"
								value="${updateSupportData.hs_date}" > 
								<input type="text" name="hs_time" id="hs_time"
								style="width: 45%" value="${updateSupportData.hs_time}">
						</label></td>
					</tr>

					<tr>

						<td><label>팀 수준<br />
						<select name="hs_level" id="hs_level" >
								<option value="" selected="selected">팀 수준 선택</option>
								<option value="2">상</option>
								<option value="1">중</option>
								<option value="0">하</option>
						</select></label></td>
						
						<td>
							<label>인원 수<br />
							<select name="hs_people" id="hs_people">
								<option value="" selected="selected">모집 인원 선택</option>
								<option value="1">1명</option>
								<option value="2">2명</option>
								<option value="3">3명</option>
								<option value="4">4명</option>
								<option value="5">5명</option>
								<option value="6">6명</option>
								<option value="7">7명</option>
								<option value="8">8명</option>
								<option value="9">9명</option>
								<option value="10">10명</option>
							</select></label>
						</td>
					</tr>

					<tr>
						
						<td><label>진행 상태<br /> <select name="hs_progress"
							id="hs_progress" >
								<option value="" selected="selected">진행 상태 선택</option>
								<option value="-1">마감</option>
								<option value="1">가능</option>
						</select></label></td>
					</tr>

					<tr>
						<td colspan="2"><label>비고<br />
						 <textarea id="hs_etc" name="hs_etc" rows="5" cols="40">${updateSupportData.hs_etc}</textarea>
						</label></td>
					</tr>
				</tbody>
			</table>

		</form>

		<div class="updateDataButton">
			<input type="button" value="수정하기" id="updateDataBtn"
				name="updateDataBtn"> <input type="button" value="취소하기"
				id="cancel" name="cancel">
		</div>

	</div>
		</article>
		<jsp:include page="../templates/footer.jsp" flush="true" />
</div>

</body>
</html>