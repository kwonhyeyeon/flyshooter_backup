<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui.min.css" />
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker -->
<script type="text/javascript" src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script type="text/javascript">
	// 매칭 게시글 저장 스크립트 Controller자바 /support/supportInsert.do 로 연결-----------------
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var hs_date = $("#hs_date").datepicker({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear: false,
			changeMonth: false,
			showOn: "focus",
			buttonImageOnly: true,
			yearSuffix: "년",
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
			maxDate: "+1M"
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

	});

	

	//---------------------------종료-----------------------------------------------
</script>

</head>
<body>

	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
		
		<h2 class="articleTit">용병지원</h2>
		
		<section id="itemArea">
		
			<form id="supportData" class="boardForm">
				<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
				<input type="hidden" name="hs_progress" id="hs_progress" value="1">
				<input type="hidden" name="hs_status" id="hs_status" value="1">
				
				<div class="boardArea">
					<section class="boardField">
						<h4>신청자명</h4>
						<label>
							<input type="text" name="m_name" id="m_name" value="${member.m_name}" disabled>
						</label>
						
						<h4>지역</h4>
						<label>
						<input type="text" name="hs_area" id="hs_area" />
						</label>
						
						<h4>팀 수준</h4>
						<select name="hs_level" id="hs_level">
							<option value="" selected="selected">팀 수준 선택</option>
							<option value="2">상</option>
							<option value="1">중</option>
							<option value="0">하</option>
						</select>
						
					</section>
					
					<section class="boardField">
						<h4>연락처</h4>
						<label class="justify">
							<input type="text" name="m_phone1" id="m_phone1" disabled />
							<span>-</span>
							<input type="text" name="m_phone2" id="m_phone2" disabled />
							<span>-</span>
							<input type="text" name="m_phone3" id="m_phone3" disabled />
						</label>
						
						<h4>가능 시간</h4>
						<label class="justify">
							<input type="text" name="hs_date" id="hs_date" />
							<input type="text" name="hs_time" id="hs_time" placeholder="00:00 ~ 00:00" />
						</label>
						
						<h4>모집 인원</h4>
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
						
					</section>
				</div>
				
				<div class="textArea">
					<h4>비고</h4>
					<textarea id="hs_etc" name="hs_etc" rows="5" cols="40"></textarea>
				</div>
				
			</form>
			
		</section>
			
		<div class="btnArea">
			<a href="/support/supportList.do" class="cancle">취소</a>
				<button id="insertDataBtn" class="active">등록</button>
		</div>
		
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
	</div>

</body>
</html>