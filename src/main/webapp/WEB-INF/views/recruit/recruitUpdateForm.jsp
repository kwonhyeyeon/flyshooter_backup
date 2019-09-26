<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병 모집 수정</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui.min.css" />

<script src="/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">
	
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var hr_m_date = $("#hr_m_date").datepicker({
			dateFormat : 'yy-mm-dd',
			buttonImage: "/application/db/jquery/images/calendar.gif",
			buttonImageOnly: true
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
		
		// select box 데이터 가져오는 스크립트------------------------------
		$("#hr_m_type").val("${updateRecruitData.hr_m_type}");
		$("#hr_level").val("${updateRecruitData.hr_level}");
		$("#hr_progress").val("${updateRecruitData.hr_progress}");
		$("#hr_people").val("${updateRecruitData.hr_people}");
		//------------------------------------------------------------

		// 수정하기 버튼 이벤트 -------------------------------
		$("#updateDataBtn").click(
				function() {
					
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


	<div id="header-wrap">
		<header id="header">
			<h1>
				<a href="/">FLY SHOOTER</a>
			</h1>

			<nav id="gnb">
				<ul>
					<li><a href="/">대관</a></li>
					<li><a href="/match/matchList.do">매치</a></li>
					<li><a href="/support/supportList.do">용병</a></li>
					<li><a href="/member/mypage/modifyLogin.do">마이페이지</a></li>
				</ul>
			</nav>

			<nav id="lnb">
				<ul>
					<c:if test="${empty mvo.m_id}">
						<li><a href="/member/join.do">회원가입</a></li>
						<li><a href="/member/login.do">로그인</a></li>
					</c:if>
					<c:if test="${not empty mvo.m_id}">
						<li><a href="/member/logout.do">로그아웃</a></li>
					</c:if>
				</ul>
			</nav>
		</header>

		<div class="menu-wrap">
			<div class="menu">
				<c:if test="${empty mvo.m_id || mvo.m_type=='1'}">
					<ul>
						<li><a href="/user/rental/location.do">대관 예약</a></li>
						<li><a href="/">대관 확인</a></li>
					</ul>
					<ul>
						<li><a href="/match/matchList.do">매치 신청</a></li>
					</ul>
					<ul>
						<li><a href="/support/supportList.do">용병 지원</a></li>
						<li><a href="/recruit/recruitList.do">용병 모집</a></li>
					</ul>
					<ul>
						<li><a href="/member/mypage/modifyLogin.do">회원 정보 수정</a></li>
					</ul>
				</c:if>

				<c:if test="${mvo.m_type=='0'}">
					<ul class="member-menu">
						<li><a href="/client/rental/rentalList.do">대관 예약 현황</a></li>
						<li><a href="/">대관 환불 현황</a></li>
						<li><a href="/">오프라인 대관 관리</a></li>
					</ul>
					<ul>
						<li><a href="/match/matchList.do">매치 신청</a></li>
					</ul>
					<ul>
						<li><a href="/support/supportList.do">용병 지원</a></li>
						<li><a href="/recruit/recruitList.do">용병 모집</a></li>
					</ul>
					<ul>
						<li><a href="/member/mypage/modifyLogin.do">회원 정보 수정</a></li>
						<li><a href="/mypage/placeList.do">구장</a></li>
						<li><a href="/">경기장/용품</a></li>
						<li><a href="/">정산 관리</a></li>
						<li><a href="/">통계</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>

	<div id="updateData" style="width: 1200px;">
		<div id="updateTitle">
			<h2>용병모집(수정)</h2>
		</div>

		<form id="recruitUpdateData" name="recruitUpdateData">
			<input type="hidden" id="hr_no" name="hr_no"
				value="${updateRecruitData.hr_no}" />
			<table class="updateTable">
			<!--<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup> -->

				<tbody>
					<tr>
						<td><label>신청자명<br />
						<input type="text" id="m_name" name="m_name" value=" ${updateRecruitData.m_name}" disabled>
						</label></td>

						<td><label>구장명<br /> <input type="text"
								name="hr_name" id="hr_name" 
								value="${updateRecruitData.hr_name}">
						</label></td>
					</tr>

					<tr>
						<td><label>연락처<br />
							<input type="text" name="m_phone1" id="m_phone1" disabled />
							<input type="text" name="m_phone2" id="m_phone2" disabled />
							<input type="text" name="m_phone3" id="m_phone3" disabled />
						</label></td>

						<td><label>구장주소<br />
								<input type="text" name="hr_address" id="hr_address"
								value="${updateRecruitData.hr_address}">
						</label></td>
					</tr>

					<tr>
						<td><label>매치일자<br /> <input type="text"
								name="hr_m_date" id="hr_m_date"
								value="${updateRecruitData.hr_m_date}" >
								<input type="text" name="hr_time" id="hr_time" value="${updateRecruitData.hr_time}">
						</label></td>
						
						<td><label>경기장<br /> <input type="text"
								name="hr_stadium" id="hr_stadium" 
								value="${updateRecruitData.hr_stadium}">
						</label></td>
					</tr>

					<tr>
						<td><label>매치형태<br /> <select name="hr_m_type"
							id="hr_m_type">
								<option value="" selected="selected">매치형태 선택</option>
								<option value="5vs5">5vs5</option>
								<option value="6vs6">6vs6</option>
						</select></label></td>
						
						<td><label>유니폼<br /> <input type="text"
								name="hr_nuiform" id="hr_nuiform" 
								value="${updateRecruitData.hr_nuiform}">
						</label></td>
					</tr>

					<tr>
						<td><label>팀 수준<br />
						<select name="hr_level" id="hr_level" >
								<option value="" selected="selected">팀 수준 선택</option>
								<option value="2">상</option>
								<option value="1">중</option>
								<option value="0">하</option>
						</select></label></td>
						
						<td>
							<label>모집인원<br />
							<select name="hr_people" id="hr_people" >
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
						<td><label>진행 상태<br /> <select name="hr_progress"
							id="hr_progress" >
								<option value="" selected="selected">진행 상태 선택</option>
								<option value="-1">마감</option>
								<option value="1">가능</option>
						</select></label></td>
					</tr>

					<tr>
						<td colspan="2"><label>비고<br />
						<textarea id="hr_etc" name="hr_etc" rows="5" cols="40">${updateRecruitData.hr_etc}</textarea>
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
</body>
</html>