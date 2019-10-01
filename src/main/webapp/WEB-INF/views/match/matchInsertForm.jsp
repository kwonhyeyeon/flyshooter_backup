<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치신청 등록</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui.min.css" />

<script src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	// 매칭 게시글 저장 스크립트 Controller자바 /match/matchInsert.do 로 연결-----------------
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var mb_m_date = $("#mb_m_date").datepicker({
			dateFormat : 'yy-mm-dd',
			button: "/application/db/jquery/images/calendar.gif",
			buttonImageOnly: false
		});
		mb_m_date.datepicker('setDate', new Date());
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

					// 유니폼(상의, 하의, 스타킹) 합치는 스크립트-----------------------------------
					var uniformTop = "";
					uniformTop += $("#mb_uniformTop").val();

					var uniformBottoms = "";
					uniformBottoms += $("#mb_uniformBottoms").val();

					var uniformStarking = "";
					uniformStarking += $("#mb_uniformStarking").val();

					var uniform = uniformTop + " " + uniformBottoms + " "
							+ uniformStarking;

					// 합친 내용 #mb_uniform에 입력
					$(function() {
						$("#mb_uniform").val(uniform);
					});
					//-----------------------------------------------------------------------

					// 입력값 체크
					if (!chkSubmit($('#mb_name'), "구장명을")) {
						return;
					} else if (!chkSubmit($('#mb_address'), "구장주소를")) {
						return;
					} else if (!chkSubmit($('#mb_stadium'), "경기장을")) {
						return;
					} else if (!chkSubmit($('#mb_time'), "경기시간을")) {
						return;
					} else if (!chkSubmit($('#mb_type'), "매치 형태를")) {
						return;
					} else if (!chkSubmit($('#mb_level'), "팀 수준을")) {
						return;
					} else {
						$("#matchData").attr({
							"method" : "post",
							"action" : "/match/matchInsert.do"
						});

						$("#matchData").submit();
					}

				});

		// 취소 버튼 클릭시 목록 화면으로 돌아감
		$("#cancel").click(function() {
			location.href = "/match/matchList.do";
		});

		
	});

	//---------------------------종료-----------------------------------------------
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

	<div id="dataInsertPage" style="width: 1200px;">
		<div id="insertTitle">
			<h2>매치신청</h2>
		</div>
		<!-- 매치 신청 작성 -->
		<div class="insertContent" >
			<form id="matchData" name="matchData">
				<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
				<input type="hidden" name="mb_progress" id="mb_progress" value="1">
				<input type="hidden" name="mb_status" id="mb_status" value="1">
				<table class="insertTable">
					<!-- 입력칸 크기 설정 -->
					<!--<colgroup>
						<col width="50%" />
						<col width="50%" />
					</colgroup> -->
					<!-- 매치 신청 작성 -->
					<tbody>
						<tr>
							<td>신청자명<br /> 
							 <input type="text" name="m_name" id="m_name" value="${member.m_name}" disabled>
							 </td>
							<td>구장명<br /> <input type="text" name="mb_name"
								id="mb_name" /></td>
						</tr>

						<tr>
							<td>연락처<br /> 
							<input type="text" name="m_phone1" id="m_phone1" disabled />
							<input type="text" name="m_phone2" id="m_phone2" disabled />
							<input type="text" name="m_phone3" id="m_phone3" disabled />
							</td>

							<td>구장주소 <br />
								<input type="text" name="mb_address" id="mb_address" />
							</td>
						</tr>

						<tr>
							<td>매치일자<br /> <input type="text" name="mb_m_date"
								id="mb_m_date" /> <input type="text" name="mb_time"
								id="mb_time" placeholder="00:00 ~ 00:00" />
							</td>
							<td>경기장<br /> <input type="text" name="mb_stadium"
								id="mb_stadium" />
							</td>
						</tr>

						<tr>
							<td>매치형태<br /> <select name="mb_type" id="mb_type">
									<option value="" selected="selected">매치형태 선택</option>
									<option value="5vs5">5vs5</option>
									<option value="6vs6">6vs6</option>
							</select>
							</td>
							
							<td>팀 수준<br /> <select name="mb_level" id="mb_level">
									<option value="" selected="selected">팀 수준 선택</option>
									<option value="2">상</option>
									<option value="1">중</option>
									<option value="0">하</option>
							</select>
							</td>
						</tr>

						<tr>
							<td>유니폼<br />
								 <input type="hidden" name="mb_uniform" id="mb_uniform" />
								 <input type="text" name="mb_uniformTop" id="mb_uniformTop" placeholder="상의" value="" />
								 <input type="text" name="mb_uniformBottoms" id="mb_uniformBottoms" placeholder="하의" value="" />
								 <input type="text" name="mb_uniformStarking" id="mb_uniformStarking" placeholder="스타킹" value="" />
							</td>

						</tr>

						<tr>
							<td colspan="2">비고<br />
								<textarea id="mb_etc" name="mb_etc" rows="5" cols="40"></textarea>
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
</body>
</html>