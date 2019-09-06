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
<script type="text/javascript" src="/resources/js/modify.js"></script>
<script>
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
						<li><a href="/">매치</a></li>
						<li><a href="/">용병</a></li>
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
							<li><a href="/">매치 신청</a></li>
						</ul>
						<ul>
							<li><a href="/">용병 지원</a></li>
							<li><a href="/">용병 모집</a></li>
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
							<li><a href="/">매치 신청</a></li>
						</ul>
						<ul>
							<li><a href="/">용병 지원</a></li>
							<li><a href="/">용병 모집</a></li>
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

		<div class="sub-v"></div>
	
		<form id="modifyForm" action="/member/mypage/modify_success.do" method="post">
			<div>
				<c:if test="${m_type=='1'}">
					<input type="radio" name="m_type" value="1" id="m_type" checked readonly/>일반 
				</c:if>
				<c:if test="${m_type=='0'}">
					<input type="radio" name="m_type" value="0" id="m_type" checked readonly/>사업자
				</c:if>
			</div>
			<div>
				<label for="id">ID</label>
				<div>
					<input type="email" id="m_id" name="m_id" value="${m_id }" readonly/>
				</div>
			</div>
			<div>
				<label for="pw">비밀 번호</label>
				<div>
					<input type="password" id="m_pw" name="m_pw" maxlength="15"
						value="">
				</div>
			</div>
			<div>
				<label for="pwCheck">비밀번호 확인 </label>
				<div>
					<input type="password" id="m_pwCheck" name="m_pwCheck"
						maxlength="15" value=""> <span
						id="pwcheck"></span>
				</div>
			</div>
			<div>
				<label for="userName">회원이름</label>
				<div>
					<input type="text" id="m_name" name="m_name" maxlength="10"
						value="${m_name }">
				</div>
			</div>
			<div>
				<label for="phone">핸드폰번호 </label>
				<div>
					<input type="text" id="m_phone" name="m_phone" maxlength="15"
						value="${m_phone }">
				</div>
			</div>
			<div>
				<div>
					<input type="submit" value="확인" id="modifyInsert" /> 
					<input type="button" value="회원탈퇴" id="delete" /> 
					<input type="button" value="홈으로" id="home" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>