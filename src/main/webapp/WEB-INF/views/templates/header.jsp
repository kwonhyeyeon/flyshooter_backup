<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header-wrap">
	<header id="header">
		<nav id="lnb">
	        <ul>
	           	<c:if test="${empty mvo.m_id}">
	                <li><a href="/member/terms.do">회원가입</a></li>
	                <li><a href="/member/login.do">로그인</a></li>
	            </c:if>
	            <c:if test="${not empty mvo.m_id}">
	            	<c:if test="${mvo.m_type == 0}">
		            	<li>오늘의 대관<a href="/client/rental/rentalList.do">${todayRental}</a> 건</li>
		                <li>정산 가능 금액<a href="/mypage/calculate.do">${passibleCal}</a> 원</li>
		                <li>미지급 정산 건수<a href="/mypage/calculate.do">${unpaidCal}</a> 건</li>
	            	</c:if>
	                <li><a href="/member/logout.do">로그아웃</a></li>
	            </c:if>
	        </ul>
	    </nav>
		
		<div id="gnb-wrap">
		    <h1><a href="/">FLY SHOOTER</a></h1>
		    <nav id="gnb">
		        <ul>
		            <li><a href="/">대관</a></li>
		            <li><a href="/match/matchList.do">매치</a></li>
		            <li><a href="/support/supportList.do">용병</a></li>
		            <li><a href="/member/mypage/modifyLogin.do">마이페이지</a></li>
		        </ul>
		    </nav>
	    </div>
	</header>
	
	<div class="menu-wrap">
	    <div class="menu">
	        <c:choose>
	            <c:when test="${mvo.m_type eq 1}">
	                <ul>
	                    <li><a href="/user/rental/location.do">경기장 예약</a></li>
	                    <li><a href="/user/rental/myRentalList.do">나의 예약 현황</a></li>
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
	            </c:when>
	
	            <c:when test="${mvo.m_type eq 0}">
	                <ul>
	                    <li><a href="/client/rental/rentalList.do">예약 현황</a></li>
	                    <li><a href="/client/rental/refundList.do">환불 현황</a></li>
	                    <li><a href="/client/rental/offlineRental.do">오프라인 대관 관리</a></li>
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
						<li><a href="/mypage/stats.do">통계</a></li>
	                </ul>
	            </c:when>
	            
				<c:otherwise>
	          		 <ul>
	                    <li><a href="/user/rental/location.do">경기장 예약</a></li>
	                    <li><a href="/user/rental/myRentalList.do">나의 예약 현황</a></li>
	                </ul>
	                <ul>
	                    <li><a href="/match/matchList.do">매치 신청</a></li>
	                </ul>
	                <ul>
	                    <li><a href="/support/supportList.do">용병 지원</a></li>
	                    <li><a href="/recruit/recruitList.do">용병 모집</a></li>
	                </ul>
				</c:otherwise>
	
	        </c:choose>
	    </div>
	</div>
</div>
		
<div class="sub-v"></div>