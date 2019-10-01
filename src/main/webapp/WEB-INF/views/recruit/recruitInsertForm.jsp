<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병 모집 등록</title>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/boardCheck.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui.min.css" />
<script type="text/javascript" src="/resources/js/common.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">
	// 매칭 게시글 저장 스크립트 Controller자바 /recruit/recruitInsert.do 로 연결-----------------
	$(function() {
		// 달력으로 날짜 선택할 수 있는 스크립트 ---------------------
		var hr_m_date = $("#hr_m_date").datepicker({
			dateFormat : 'yy-mm-dd',
			buttonImage: "/application/db/jquery/images/calendar.gif",
			buttonImageOnly: true
		});
		hr_m_date.datepicker('setDate', new Date());
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
					uniformTop += $("#hr_uniformTop").val();

					var uniformBottoms = "";
					uniformBottoms += $("#hr_uniformBottoms").val();

					var uniformStarking = "";
					uniformStarking += $("#hr_uniformStarking").val();

					var uniform = uniformTop + " " + uniformBottoms + " "
							+ uniformStarking;

					// 합친 내용 #hr_uniform에 입력
					$(function() {
						$("#hr_nuiform").val(uniform);
					});
					//-----------------------------------------------------------------------

					// 입력값 체크
					if (!chkSubmit($('#hr_name'), "구장명을")) {
						return;
					} else if (!chkSubmit($('#hr_address'), "구장주소를")) {
						return;
					} else if (!chkSubmit($('#hr_stadium'), "경기장을")) {
						return;
					} else if (!chkSubmit($('#hr_time'), "경기시간을")) {
						return;
					} else if (!chkSubmit($('#hr_people'), "모집 인원을")) {
						return;
					} else if (!chkSubmit($('#hr_m_type'), "매치 형태를")) {
						return;
					} else if (!chkSubmit($('#hr_level'), "팀 수준을")) {
						return;
					} else {
						$("#recruitData").attr({
							"method" : "post",
							"action" : "/recruit/recruitInsert.do"
						});

						$("#recruitData").submit();
					}

				});

		// 취소 버튼 클릭시 목록 화면으로 돌아감
		$("#cancel").click(function() {
			location.href = "/recruit/recruitList.do";
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
			<h2>용병모집</h2>
		</div>
		<!-- 매치 신청 작성 -->
		<div class="insertContent">
			<form id="recruitData" name="recruitData">
				<input type="hidden" name="m_id" id="m_id" value="${mvo.m_id}">
				<input type="hidden" name="hr_progress" id="hr_progress" value="1">
				<input type="hidden" name="hr_status" id="hr_status" value="1">
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
							<td>구장명<br /> <input type="text" name="hr_name"
								id="hr_name" /></td>
						</tr>

						<tr>
							<td>연락처<br /> 
								<input type="text" name="m_phone1" id="m_phone1" disabled />
								<input type="text" name="m_phone2" id="m_phone2" disabled />
								<input type="text" name="m_phone3" id="m_phone3" disabled />
							</td>

							<td>구장주소 <br />
								<input type="text" name="hr_address" id="hr_address" />
							</td>
						</tr>

						<tr>
							<td>매치일자<br /> <input type="text" name="hr_m_date"
								id="hr_m_date" /> <input type="text" name="hr_time"
								id="hr_time" placeholder="00:00 ~ 00:00" /></td>
							
							<td>경기장<br /> <input type="text" name="hr_stadium"
								id="hr_stadium" />
							</td>
							
						</tr>

						<tr>
							
							<td>매치형태<br /> <select name="hr_m_type" id="hr_m_type">
									<option value="" selected="selected">매치형태 선택</option>
									<option value="5vs5">5vs5</option>
									<option value="6vs6">6vs6</option>
							</select>
							</td>
							
							<td>유니폼<br /> <input type="hidden" name="hr_nuiform"
								id="hr_nuiform" /> <input type="text" name="hr_uniformTop"
								id="hr_uniformTop" placeholder="상의" value="" /> <input
								type="text" name="hr_uniformBottoms" id="hr_uniformBottoms"
								placeholder="하의" value="" /> <input type="text"
								name="hr_uniformStarking" id="hr_uniformStarking"
								placeholder="스타킹" value="" />
							</td>
						</tr>

						<tr>
							<td>팀 수준<br /> <select name="hr_level" id="hr_level">
									<option value="" selected="selected">팀 수준 선택</option>
									<option value="2">상</option>
									<option value="1">중</option>
									<option value="0">하</option>
							</select>
							</td>
							
							<td>모집인원<br/> 
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
							</td>
						</tr>
						<tr>
							<td colspan="2">비고<br />
								<textarea id="hr_etc" name="hr_etc" rows="5" cols="40"></textarea>
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