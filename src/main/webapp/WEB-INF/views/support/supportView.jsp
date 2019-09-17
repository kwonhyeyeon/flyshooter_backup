<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치신청 상세보기</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	// 수정 페이지 이동  스크립트
	// 버튼 클릭 시 등록된 글의 내용을 DB에서 불러옴
	$(function() {
		var boardID = "${supportView.m_id}";
		
		var id = "";
		id += $("#m_id").val();
		
		$(document).on('click', '#supportUpdateBtn', function() {
			if (id != "" && id == boardID) {
				var url = "${pagecontext.request.contextpath}/support/supportUpdateForm.do";
				url = url + "?hs_no=" + ${supportView.hs_no};
				location.href = url;
			} else if (id == "") {
				alert("로그인 후 수정 할 수 있습니다.");
				location.href = "/support/supportList.do";
			} else if ( id != boardID) {
				alert("다른 회원의 글은 수정 할 수 없습니다.")
				location.href = "/support/supportList.do";
			}
		});
		
		$("#returnBtn").click(function() {
			location.href = "/support/supportList.do";
		});
	});
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
					<c:if test="${empty m_id}">
						<li><a href="/member/join.do">회원가입</a></li>
						<li><a href="/member/login.do">로그인</a></li>
					</c:if>
					<c:if test="${not empty m_id}">
						<li><a href="/member/logout.do">로그아웃</a></li>
					</c:if>
				</ul>
			</nav>
		</header>

		<div class="menu-wrap">
			<div class="menu">
				<c:if test="${empty m_id || m_type=='1'}">
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

				<c:if test="${m_type=='0'}">
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

	<div id="supportModalDialog" class="supportModal" role="dialog">
		<div>
			<h2>매치신청 상세보기</h2>
		</div>
		
		<div>
			<input type="hidden" name="m_id" id="m_id" value="${m_id}">
		</div>

		<div class="supportContentView">
			<table border="1">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th>작성자</th>
						<td>${supportView.m_name}</td>
						<th>지역</th>
						<td>${supportView.hs_area}</td>
					</tr>
					<tr>
						<th>가능시간</th>
						<td colspan="3">${supportView.hs_date} ${supportView.hs_time}</td>
					</tr>
					<tr>
						<th>인원 수</th>
						<td>${supportView.hs_people}</td>
						<th>팀 수준</th>
						<td><span class="statusText">
							<c:choose>
								<c:when test="${supportView.hs_level == '2'}">상</c:when>
								<c:when test="${supportView.hs_level == '1'}">중</c:when>
								<c:when test="${supportView.hs_level == '0'}">하</c:when>
							</c:choose>
						</span></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<c:choose>
								<c:when test="${supportView.hs_progress == '1'}">${supportView.m_phone}</c:when>
								<c:when test="${supportView.hs_progress == '0'}"> </c:when>
								<c:when test="${supportView.hs_progress == '-1'}"> </c:when>
							</c:choose>
						</td>
						<th>진행상태</th>
						<td><span class="supportStatus"> 
								<c:choose>
									<c:when test="${supportView.hs_progress == '1'}">가능</c:when>
									<c:when test="${supportView.hs_progress == '0'}">종료</c:when>
									<c:when test="${supportView.hs_progress == '-1'}">마감</c:when>
								</c:choose>
						</span></td>
					</tr>
					
					<tr>
						<td colspan="4">${supportView.hs_etc}</td>
					</tr>
				</tbody>
			</table>

			<div class="sUpdateBtn">
				<input type="button" value="수정하기" name="supportUpdateBtn"
					id="supportUpdateBtn" width="100px" height="40px">
				<input type="button" value="돌아가기" name="returnBtn" id="returnBtn" width="100px" height="40px">
			</div>

		</div>

	</div>
</body>
</html>