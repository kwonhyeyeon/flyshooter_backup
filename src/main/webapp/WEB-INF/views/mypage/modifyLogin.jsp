<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FLY SHOOTER</title>

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#home").click(function() {
			location.href = "/";
		});
		errCodeCheck();
	});
	function errCodeCheck() {
		var errCode = '<c:out value = "${errCode}"/>';
		if (errCode != "") {
			//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
			switch (parseInt(errCode)) {
			case 1:
				alert("비밀번호 일치 하지않습니다. 다시 시도해 주세요.");
				return false;
			}
		}
	}
	$(function() {
		$("#gnb").hover(function() {
			$(".menu-wrap").slideDown(500);
		});
		$(".menu-wrap").mouseleave(function() {
			$(".menu-wrap").slideUp(500);
		});
	})
</script>

<body>
	<div>

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
							<li><a href="/mypage/placeChoice.do">경기장/용품</a></li>
							<li><a href="/mypage/calculate.do">정산 관리</a></li>
							<li><a href="/">통계</a></li>
						</ul>
					</c:if>
				</div>
			</div>
		</div>

		<div class="sub-v"></div>

		<div>
			<form id="modifyForm" action="/member/mypage/modify.do" method="post">
				<div>
					<label for="pw">비밀 번호</label>
					<div>
						<input type="password" id="m_pw" name="m_pw" maxlength="15"
							placeholder="Password">
					</div>
				</div>
				<div>
					<input type="submit" value="확인" id="modifyForm" /> <input
						type="button" value="홈으로" id="home" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>