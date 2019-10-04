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
	
	<div id="wrapper">
		
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
		
			<h2 class="articleTit">매치 신청</h2>
			
			<section class="itemArea">
			
				<form id="matchData">
					<input type="hidden" name="mb_progress" id="mb_progress" value="1">
					<input type="hidden" name="mb_status" id="mb_status" value="1">
					
					<div class="insertMatch">
						<section class="matchField">
							<!-- 신청자명 -->
							<h4>신청자명</h4>
							<label>
								<input type="text" name="m_name" id="m_name" value="${member.m_name}" disabled>
							</label>
							
							<!-- 연락처 -->
							<h4>연락처</h4>
							<label class="justify">
								<input type="text" name="m_phone1" id="m_phone1" disabled />
								<input type="text" name="m_phone2" id="m_phone2" disabled />
								<input type="text" name="m_phone3" id="m_phone3" disabled />
							</label>
							
							<!-- 매치일자 -->
							<h4>매치일자</h4>
							<label class="justify">
								<input type="text" name="mb_m_date" id="mb_m_date" style="width:150px;" /> 
								<input type="text" name="mb_time" id="mb_time" placeholder="00시 ~ 00시" />
							</label>
							
							<!-- 매치 형태 -->
							<h4>매치 형태</h4>
							<select name="mb_type" id="mb_type">
								<option value="" selected="selected">매치 형태 선택</option>
								<option value="5vs5">5vs5</option>
								<option value="6vs6">6vs6</option>
							</select>
							
							<!-- 유니폼 -->
							<h4>유니폼</h4>
							<label class="justify">
								<input type="hidden" name="mb_uniform" id="mb_uniform" />
								<input type="text" name="mb_uniformTop" id="mb_uniformTop" placeholder="상의" />
								<input type="text" name="mb_uniformBottoms" id="mb_uniformBottoms" placeholder="하의" />
								<input type="text" name="mb_uniformStarking" id="mb_uniformStarking" placeholder="스타킹" />
							</label>
						</section>
						
						<section class="matchField">
							<!-- 구장명 -->
							<h4>구장명</h4>
							<label>
								<input type="text" name="mb_name" id="mb_name" />
							</label>
							
							<!-- 구장 주소 -->
							<h4>구장 주소</h4>
							<label>
								<input type="text" name="mb_address" id="mb_address" />
							</label>
							
							<!-- 경기장 -->
							<h4>경기장</h4>
							<label>
								<input type="text" name="mb_stadium" id="mb_stadium" />
							</label>
							
							<!-- 팀 수준 -->
							<h4>팀 수준</h4>
							<select name="mb_level" id="mb_level">
								<option value="" selected="selected">팀 수준 선택</option>
								<option value="2">상</option>
								<option value="1">중</option>
								<option value="0">하</option>
							</select>
						</section>
					</div>
					
					<div class="textArea">
						<h4>비고</h4>
						<textarea id="mb_etc" name="mb_etc" rows="5" cols="40"></textarea>
					</div>
					
				</form>
			
			</section>
			
			<div id="dataInsertPage" style="width: 1200px;">
		<!-- 매치 신청 작성 -->
		<div class="insertContent" >
			<form id="matchData" name="matchData">
				
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
							 
							 </td>
							<td>구장명<br /> </td>
						</tr>

						<tr>
							<td>연락처<br /> 
							
							</td>

							<td>구장주소 <br />
								
							</td>
						</tr>

						<tr>
							<td>매치일자<br /> 
							</td>
							<td>경기장<br /> 
							</td>
						</tr>

						<tr>
							<td>매치형태<br /> 
							</td>
							
							<td>팀 수준<br /> 
							</td>
						</tr>

						<tr>
							<td>유니폼<br />
								 
							</td>

						</tr>

						<tr>
							<td colspan="2">비고<br />
								
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