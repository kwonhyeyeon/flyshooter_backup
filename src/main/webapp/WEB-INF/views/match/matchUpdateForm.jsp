<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		var mb_m_date = $("#mb_m_date").datepicker({
			dateFormat : 'yy-mm-dd',
			buttonImage: "/application/db/jquery/images/calendar.gif",
			buttonImageOnly: true
		});
		//-------------------------------------------------
		
		//------연락처 자르기 자바 스크립트------------------------
		var phone = "${updateMatchData.m_phone}";
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
		$("#mb_type").val("${updateMatchData.mb_type}");
		$("#mb_level").val("${updateMatchData.mb_level}");
		$("#mb_progress").val("${updateMatchData.mb_progress}");
		//------------------------------------------------------------

		// 수정하기 버튼 이벤트 -------------------------------
		$("#updateDataBtn").click(
				function() {
					
					// 입력값 체크
					if (!chkSubmit($('#mb_name'), "구장명을")) {
						return;
					} else if (!chkSubmit($('#mb_address'), "구장주소를")) {
						return;
					} else if (!chkSubmit($('#mb_type'), "매치 형태를")) {
						return;
					} else if (!chkSubmit($('#mb_stadium'), "경기장을")) {
						return;
					} else if (!chkSubmit($('#mb_time'), "경기시간을")) {
						return;
					} else if (!chkSubmit($('#mb_level'), "팀 수준을")) {
						return;
					} else if (!chkSubmit($('#mb_progress'), "진행 상황을")) {
						return;
					} else {
						$("#matchUpdateData").attr({
							"method" : "POST",
							"action" : "/match/matchUpdate.do"
						});
						
						$("#matchUpdateData").submit();
					}
					
				});
		
		// 취소 버튼 클릭 시 새로고침
		$("#cancel").click(function() {
			location.href = "/match/matchList.do";
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
			<h2>매치신청(수정)</h2>
		</div>

		<form id="matchUpdateData" name="matchUpdateData">
			<input type="hidden" id="mb_no" name="mb_no"
				value="${updateMatchData.mb_no}" />
			<table class="updateTable">
				<!-- <colgroup>
					<col width="50%" />
					<col width="50%" />
				</colgroup> -->

				<tbody>
					<tr>
						<td><label>신청자명<br />
						<input type="text" id="m_name" name="m_name" value=" ${updateMatchData.m_name}" disabled>
						</label></td>

						<td><label>구장명<br /> <input type="text"
								name="mb_name" id="mb_name" 
								value="${updateMatchData.mb_name}">
						</label></td>
					</tr>

					<tr>
						<td><label>연락처<br />
							<input type="text" name="m_phone1" id="m_phone1" disabled />
							<input type="text" name="m_phone2" id="m_phone2" disabled />
							<input type="text" name="m_phone3" id="m_phone3" disabled />
						</label></td>

						<td><label>구장주소<br />
								<input type="text" name="mb_address" id="mb_address" value="${updateMatchData.mb_address}">
						</label></td>
					</tr>

					<tr>
						<td><label>매치일자<br /> <input type="text"
								name="mb_m_date" id="mb_m_date"
								value="${updateMatchData.mb_m_date}" >
								<input type="text" name="mb_time" id="mb_time"
								style="width: 45%" value="${updateMatchData.mb_time}">
						</label></td>
						<td><label>경기장<br /> <input type="text"
								name="mb_stadium" id="mb_stadium" 
								value="${updateMatchData.mb_stadium}">
						</label></td>
					</tr>

					<tr>
						<td><label>매치형태<br /> <select name="mb_type" id="mb_type">
								<option value="" selected="selected">매치형태 선택</option>
								<option value="5vs5">5vs5</option>
								<option value="6vs6">6vs6</option>
						</select></label></td>
						<td><label>유니폼<br /> <input type="text"
								name="mb_uniform" id="mb_uniform"
								value="${updateMatchData.mb_uniform}">
						</label></td>
					</tr>

					<tr>
						<td><label>팀 수준<br />
						<select name="mb_level" id="mb_level">
								<option value="" selected="selected">팀 수준 선택</option>
								<option value="2">상</option>
								<option value="1">중</option>
								<option value="0">하</option>
						</select></label></td>
						<td><label>진행 상태<br /> <select name="mb_progress"
							id="mb_progress" >
								<option value="" selected="selected">진행 상태 선택</option>
								<option value="-1">마감</option>
								<option value="1">가능</option>
						</select></label></td>
					</tr>

					<tr>
						<td colspan="2"><label>비고<br />
						<textarea id="mb_etc" name="mb_etc" rows="5" cols="40">${updateMatchData.mb_etc}</textarea>
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