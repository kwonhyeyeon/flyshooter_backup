<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병지원 등록</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui.min.css" />
<script src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	// 매칭 게시글 저장 스크립트 Controller자바 /support/supportInsert.do 로 연결-----------------
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var hs_date = $("#hs_date").datepicker({
			dateFormat : 'yy-mm-dd',
			buttonImage: "/application/db/jquery/images/calendar.gif",
			buttonImageOnly: true
		});
		hs_date.datepicker('setDate', new Date());
		//-------------------------------------------------
		
		//------연락처 자르기 자바 스크립트------------------------
		
		var phone = "${member.m_phone}";
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
		
		// 등록버튼 클릭시 이벤트 스크립트
		$("#insertDataBtn").click(
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
						$("#supportData").attr({
							"method" : "post",
							"action" : "/support/supportInsert.do"
						});

						$("#supportData").submit();
					}

				});

		// 취소 버튼 클릭시 목록 화면으로 돌아감
		$("#cancel").click(function() {
			location.href = "/support/supportList.do";
		});

		
	});

	

	//---------------------------종료-----------------------------------------------
</script>

</head>
<body>

	<div id="wrapper">

		
		<jsp:include page="../templates/header.jsp" flush="true" />
		<article id="contents">
			<div id="dataInsertPage" style="width: 1200px;">
		<div id="insertTitle">
			<h2>용병지원</h2>
		</div>
		<!-- 용병 지원 작성 -->
		<div class="insertContent">
			<form id="supportData" name="supportData">
				<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
				<input type="hidden" name="hs_progress" id="hs_progress" value="1">
				<input type="hidden" name="hs_status" id="hs_status" value="1">
				<table class="insertTable">
					<!-- 입력칸 크기 설정 -->
			<!--<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup> -->
					<!-- 용병 지원 작성 -->
					<tbody>
						<tr>
							<td>신청자명<br /> 
							 <input type="text" name="m_name" id="m_name" value="${member.m_name}" disabled>
							 </td>
							<td>연락처<br /> 
							<input type="text" name="m_phone1" id="m_phone1" disabled />
							<input type="text" name="m_phone2" id="m_phone2" disabled />
							<input type="text" name="m_phone3" id="m_phone3" disabled />
							</td>
							
						</tr>

						<tr>

							<td>지역 <br />
								<input type="text" name="hs_area" id="hs_area" />
							</td>
						
							<td>가능시간<br /> <input type="text" name="hs_date"
								id="hs_date" /> <input type="text" name="hs_time"
								id="hs_time" placeholder="00:00 ~ 00:00" /></td>
						</tr>

						<tr>
							<td>팀 수준<br /> <select name="hs_level" id="hs_level">
									<option value="" selected="selected">팀 수준 선택</option>
									<option value="2">상</option>
									<option value="1">중</option>
									<option value="0">하</option>
							</select>
							</td>
							
							<td>인원 수<br/> 
							<select name="hs_people" id="hs_people" >
								<option value="" selected="selected">인원 수 선택</option>
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
							</select>
							</td>
						</tr>

						<tr>
							<td colspan="2">비고<br />
							 <textarea id="hs_etc" name="hs_etc" rows="5" cols="40"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div class="insertData">
			<input type="button" value="등록하기" name="insertDataBtn"
				id="insertDataBtn" /> <input type="button" value="취소하기"
				name="cancel" id="cancel" />
		</div>
	</div>
		</article>
				<jsp:include page="../templates/footer.jsp" flush="true" />
	</div>

</body>
</html>