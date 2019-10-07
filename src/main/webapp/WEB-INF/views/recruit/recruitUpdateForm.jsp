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
		var hr_m_date = $("#hr_m_date").datepicker({
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
		var phone = "${updateRecruitData.m_phone}";
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
		
		//------유니폼 자르기 자바 스크립트--------------------------
		
		var uniformData = "${updateRecruitData.hr_nuiform}";
		var hr_nuiform = uniformData.split(' ');
		
		
		var u1 = hr_nuiform[0];
		var u2 = hr_nuiform[1];
		var u3 = hr_nuiform[2];
		
		$("#hr_nuiformTop").val(u1);
	
		$("#hr_nuiformBottoms").val(u2);
	
		$("#hr_nuiformStarking").val(u3);

		//-------------------------------------------------

		// select box 데이터 가져오는 스크립트------------------------------
		$("#hr_m_type").val("${updateRecruitData.hr_m_type}");
		$("#hr_level").val("${updateRecruitData.hr_level}");
		$("#hr_progress").val("${updateRecruitData.hr_progress}");
		$("#hr_people").val("${updateRecruitData.hr_people}");
		//------------------------------------------------------------

		// 수정하기 버튼 이벤트 -------------------------------
		$("#updateDataBtn").click(function() {
			
			//------유니폼 저장시 자바 스크립트--------------------------
			
			var top = $("#hr_nuiformTop").val();
			
			var bottoms = $("#hr_nuiformBottoms").val();

			var starking = $("#hr_nuiformStarking").val();
			
			var uniform = top + " " + bottoms + " " + starking;
		
			// 합친 내용 #mb_uniform에 입력
			$("#hr_nuiform").val(uniform);
			
			//-------------------------------------------------

			// 입력값 체크
			if (!chkSubmit($('#hr_name'), "구장명을")) {
				return;
			} else if (!chkSubmit($('#hr_address'), "구장주소를")) {
				return;
			} else if (!chkSubmit($('#hr_m_type'), "매치 형태를")) {
				return;
			} else if (!chkSubmit($('#hr_stadium'), "경기장을")) {
				return;
			} else if (!chkSubmit($('#hr_time'), "경기시간을")) {
				return;
			} else if (!chkSubmit($('#hr_level'), "팀 수준을")) {
				return;
			} else if (!chkSubmit($('#hr_people'), "모집 인원을")) {
				return;
			} else if (!chkSubmit($('#hr_progress'), "진행 상황을")) {
				return;
			} else {
				$("#recruitUpdateData").attr({
					"method" : "POST",
					"action" : "/recruit/recruitUpdate.do"
				});

				$("#recruitUpdateData").submit();
			}

		});

		// 취소 버튼 클릭 시 새로고침
		$("#cancel").click(function() {
			location.href = "/recruit/recruitList.do";
		});
	});
	//--------종료-------------------------------------
</script>

</head>
<body>


	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
		
			<h2 class="articleTit">용병모집 수정 </h2>
		
			<section id="itemArea">
			
					<form id="recruitUpdateData" class="boardForm">
					
					<input type="hidden" id="hr_no" name="hr_no" value="${updateRecruitData.hr_no}" />
					
					<div class="boardArea">
						<section class="boardField">
							<h4>신청자명</h4>
							<label>
								<input type="text" id="m_name" name="m_name" value=" ${updateRecruitData.m_name}" disabled>
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
								<input type="text" name="hr_m_date" id="hr_m_date" value="${updateRecruitData.hr_m_date}">
								<input type="text" name="hr_time" id="hr_time" value="${updateRecruitData.hr_time}">
							</label>
							
							<h4>매치형태</h4>
							<select name="hr_m_type" id="hr_m_type">
								<option value="" selected="selected">매치형태 선택</option>
								<option value="5vs5">5vs5</option>
								<option value="6vs6">6vs6</option>
							</select>
							
							<h4>유니폼</h4>
							<label class="justify">
								<input type="hidden" name="hr_nuiform" id="hr_nuiform">
								<input type="text" name="hr_nuiformTop" id="hr_nuiformTop" placeholder="상의">
								<input type="text" name="hr_nuiformBottoms" id="hr_nuiformBottoms" placeholder="하의">
								<input type="text" name="hr_nuiformStarking" id="hr_nuiformStarking" placeholder="스타킹">
							</label>
							
							<h4>진행 상태</h4>
							<select name="hr_progress" id="hr_progress">
								<option value="" selected="selected">진행 상태 선택</option>
								<option value="-1">마감</option>
								<option value="1">가능</option>
							</select>
						</section>	
						
						<section class="boardField">
						
							<h4>구장명</h4>
							<label>
								<input type="text" name="hr_name" id="hr_name" value="${updateRecruitData.hr_name}">
							</label>
							
							<h4>구장 주소</h4>
							<label>
								<input type="text" name="hr_address" id="hr_address" value="${updateRecruitData.hr_address}">
							</label>
							
							<h4>경기장</h4>
							<label>
								<input type="text" name="hr_stadium" id="hr_stadium" value="${updateRecruitData.hr_stadium}">
							</label>
							
								<!-- 팀 수준 -->
							<h4>팀 수준</h4>	
							<select name="hr_level" id="hr_level">
								<option value="" selected="selected">팀 수준 선택</option>
								<option value="2">상</option>
								<option value="1">중</option>
								<option value="0">하</option>
							</select>
							
							<h4>모집인원</h4>
							<select name="hr_people" id="hr_people">
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
							</select>
							
						</section>
					</div>
					
					<div class="textArea">
						<h4>비고</h4>
						<textarea id="hr_etc" name="hr_etc" rows="5" cols="40">${updateRecruitData.hr_etc}</textarea>
					</div>
					
				</form>
					
			</section>
				

				<div class="btnArea">
					<a href="/recruit/recruitList.do" class="cancle">취소</a>
					<button id="updateDataBtn" class="active">등록</button>
				</div>

		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>

</body>
</html>