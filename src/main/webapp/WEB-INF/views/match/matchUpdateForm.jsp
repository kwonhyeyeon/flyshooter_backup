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
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var mb_m_date = $("#mb_m_date").datepicker({
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
		
			<h2 class="articleTit">매치 수정</h2>
			
			<section id="itemArea">
				
				<form id="matchUpdateData" class="boardForm">
				
					<input type="hidden" id="mb_no" name="mb_no" value="${updateMatchData.mb_no}" />
					
					<div class="boardArea">
						<section class="boardField">
						<!-- 신청자명 -->
							<h4>신청자명</h4>
							<label>
								<input type="text" id="m_name" name="m_name" value=" ${updateMatchData.m_name}" disabled>
							</label>
							
							<!-- 연락처 -->
							<h4>연락처</h4>
							<label class="justify">
								<input type="text" name="m_phone1" id="m_phone1" disabled />
								<span>-</span>
								<input type="text" name="m_phone2" id="m_phone2" disabled />
								<span>-</span>
								<input type="text" name="m_phone3" id="m_phone3" disabled />
							</label>
							
							<!-- 매치일자 -->
							<h4>매치일자</h4>
							<label class="justify">
								<input type="text" name="mb_m_date" id="mb_m_date" value="${updateMatchData.mb_m_date}" >
								<input type="text" name="mb_time" id="mb_time" value="${updateMatchData.mb_time}" placeholder="00시 ~ 00시">
							</label>
							
							<!-- 매치 형태 -->
							<h4>매치 형태</h4>
							<select name="mb_type" id="mb_type">
								<option selected="selected">매치 형태 선택</option>
								<option value="5vs5">5 vs 5</option>
								<option value="6vs6">6 v s6</option>
							</select>
							
							<!-- 유니폼 -->
							<h4>유니폼</h4>
							<label class="justify">
								<!-- 유니폼 수정 -->
								<input type="text" name="mb_uniform" id="mb_uniform" value="${updateMatchData.mb_uniform}">
								<input type="hidden" name="mb_uniform" id="mb_uniform" />
								<%-- <input type="text" name="mb_uniformTop" id="mb_uniformTop" value="${updateMatchData.mb_uniformTop}" placeholder="상의" />
								<input type="text" name="mb_uniformBottoms" id="mb_uniformBottoms" value="${updateMatchData.mb_uniformBottoms}" placeholder="하의" />
								<input type="text" name="mb_uniformStarking" id="mb_uniformStarking" value="${updateMatchData.mb_uniformStarking}" placeholder="스타킹" /> --%>
							</label>
						</section>
						
						<section class="boardField">
							<!-- 구장명 -->
							<h4>구장명</h4>
							<label>
								<input type="text" name="mb_name" id="mb_name" value="${updateMatchData.mb_name}">
							</label>
							
							<!-- 구장 주소 -->
							<h4>구장 주소</h4>
							<label>
								<input type="text" name="mb_address" id="mb_address" value="${updateMatchData.mb_address}">
							</label>
							
							<!-- 경기장 -->
							<h4>경기장</h4>
							<label>
								<input type="text" name="mb_stadium" id="mb_stadium" value="${updateMatchData.mb_stadium}">
							</label>
							
							<!-- 팀 수준 -->
							<h4>팀 수준</h4>
							<select name="mb_level" id="mb_level">
									<option selected="selected">팀 수준 선택</option>
									<option value="2">상</option>
									<option value="1">중</option>
									<option value="0">하</option>
							</select>
							
							<h4>신청 여부</h4>
							<select name="mb_progress" id="mb_progress" >
		                        <option selected="selected">신청 여부 선택</option>
		                        <option value="-1">마감</option>
		                        <option value="1">가능</option>
	                  		</select>
						</section>
					</div>
					
					<div class="textArea">
						<h4>비고</h4>
						<textarea id="mb_etc" name="mb_etc" rows="5" cols="40">${updateMatchData.mb_etc}</textarea>
					</div>
				
				</form>
			
			</section>
			
			<div class="btnArea">
				<a href="/match/matchList.do" class="cancle">취소</a>
				<button id="updateDataBtn" class="active">수정</button>
			</div>

		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>

</body>
</html>