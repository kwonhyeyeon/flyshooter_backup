<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/resources/css/reset.css" />
<link rel="stylesheet"  href="/resources/css/style.css" />
<!-- datepicker를 사용하기 위한 css, js -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- end datepicker -->
<script type="text/javascript" src="/resources/js/rentalStadium.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtzXWTJTZ4tnfXjE2yVo3YjQndGozENJQ&callback=initMap"></script>
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
</head>
<body>
	<div id="wrapper">

		<div id="header-wrap">
			<header id="header">
				<h1><a href="/">FLY SHOOTER</a></h1>
				
				<nav id="gnb">
					<ul>
						<li><a href="/">대관</a></li>
						<li><a href="/match/matchList.do">매치</a></li>
						<li><a href="/support/supportList.do">용병</a></li>
						<li><a href="/">마이페이지</a></li>
					</ul>
				</nav>
				
				<nav id="lnb">
					<ul>
						<c:if test="${empty m_id}">
							<li><a href="/member/join.do">회원가입</a></li>
							<li><a href="/">로그인</a></li>
						</c:if>
						<c:if test="${not empty m_id}">
							<li><a href="/">로그아웃</a></li>
						</c:if>
					</ul>
				</nav>
			</header>
			
			<div class="menu-wrap">
				<div class="menu">
					<c:choose>
						<c:when test="${m_type==1}">
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
							<li><a href="/">회원 정보 수정</a></li>
						</ul>
						</c:when>
					
						<c:when test="${m_type==0}">
						<ul class="member-menu">
							<li><a href="/user/rental/rentalList.do">대관 예약 현황</a></li>
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
							<li><a href="/">회원 정보 수정</a></li>
							<li><a href="/">구장</a></li>
							<li><a href="/">경기장/용품</a></li>
							<li><a href="/">정산 관리</a></li>
							<li><a href="/">통계</a></li>
						</ul>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		
		<div class="sub-v"></div>
		
		<!-- 경기장 예약 -->
		<div class="stadiumRental">
			<div class="stadiumInfo">
				
				<div>
					<!-- 사이트 로고이미지 출력 -->
					<article id="stadiumImg">
							<img src="/resources/img/default_img.jpg" />
					</article>
					<br />
					<br />
					<!-- 구장정보 -->
					<article id="placeInfo">
						[구장정보]
						 <br />
						 ${ pvo.p_name }
						 <br />
						 ${ pvo.p_address }
						 
						 <br />
						 ${ pvo.p_phone }
						 <br />
						 [영업시간]
						 <br />
						 ${ pvo.p_open } ~ ${ pvo.p_close }(시)
					</article>
					
					<br />
					<br />
					<article id="map"> 
					 <script>
					 	
					      function initMap() {
					        var uluru = {lat: -25.363, lng: 131.044};
					        var map = new google.maps.Map(document.getElementById('map'), {
					          zoom: 4,
					          center: uluru
					        });
					        var marker = new google.maps.Marker({
					          position: uluru,
					          map: map
					        });
					      }
				    </script>
					
					</article>
					
					<!-- 이용약관 -->
					<article id="termsOfService">
						[환불규정및 이용약관 include예정]						
					</article>
				</div>				

			</div>
		
			<div class="stadiumCal">
			
				<form id="hidden_form">
					<input type="hidden" value="${ pvo.p_holiday_start }" id="holiday_start"/>
					<input type="hidden" value="${ pvo.p_holiday_end }" id="holiday_end"/>
					<input type="hidden" value="${ pvo.p_holiday }" id="holiday"/>
				</form>
				
				<form id="rentalStadiumInfo">
					<input type="hidden" id="p_open" value="${ pvo.p_open }" />
					<input type="hidden" id="p_close" value="${ pvo.p_close }" />
				</form>
				
					<table>
						<tr>
							<td><input type="text" id="datepicker" name="datepicker" placeholder="날짜를 선택하세요"/></td>
						</tr>
						<tr>
							<td>
								<select id="stadiumSelectBox" name="selectStadium" >
								<option>경기장선택</option>
									<c:forEach var="stadium" items="${ stadiumList }">
										<option value="${ stadium.s_no },${ stadium.s_hours},${stadium.s_n_fee },${stadium.s_d_fee },${stadium.s_n_fee_w },${stadium.s_d_fee_w }">${ stadium.s_name }</option>
									</c:forEach>	
								</select>			
							</td>
						</tr>		
						<tr>
							<td>예약가능시간</td>
						</tr>			
					</table>
				
				
				<div id="selectTime">
					
				</div>
				<c:if test="${ not empty itemsList }">
					<button id="showItems">옵션보기</button>
				</c:if>
				<div id="items" style="display:none">
					<c:if test="${not empty itemsList}">
						<button id="hideItems">옵션닫기</button>
						<table>
							<c:forEach var="item" items="${ itemsList }" varStatus="status">
								<tr class="tac" data-num="${ item.i_rental_fee }">
									<td><p style="display:none" class="i_no">${ item.i_no }</p>${item.i_name }</td>
									<td class="r_ec"><input type="number" class="i_ea" placeholder="0"  min="0" max="100" /></td>
									<td>대여료</td>
									<td><span class="price">0원</span></td>
								</tr>
							</c:forEach>
						</table>
						<input type="text" value="${ itemsList.size() }" id="items_ec" placeholder="0"/>
					</c:if>
				</div>
				
				<p>옵션  <span id="itemsPrice">0</span> 원</p>
				<p>대관료 <span id='payment'>0</span> 원</p>
				<p>총 결제금액  <span id="totalMoney">0</span> 원</p>
				
				<div id='goRental' style='display:none'>
	 				<button id='goRentalBtn'>결제</button>
	  			</div>				
			</div>
		</div>
		<!-- 경기장 예약 -->
		
	</div>
	
	<div id="dialog" title="결제창" style="display: none">
		<form id="insertRentalForm">
			<input type="text" id="r_reserve_date" name="r_reserve_date" />
			<input type="text" id="s_no" name="s_no" />
			<input type="text" id="r_start" name="r_start" />
			<input type="text" id="r_total_pay" name="r_total_pay" />
			<input type="text" id="r_pay_type" name="r_pay_type"/>
			<input type="text" id="r_bank" name="r_bank" />	
			<input type="text" id="r_account_num" name="r_account_num"/>
			<input type="text" id="r_account" name="r_account"/>		
			<input type="text" id="items_no" name="items_no"/>
			<input type="text" id="items_ea" name="items_ea"/>
		</form>	
			<h1>결제</h1>
			<hr />
			<label><input type="radio" name="r_pay_type" value="2" checked="checked"/>계좌이체</label>
			<label><input type="radio" name="r_pay_type" value="1"/>카드결제</label>
			<p>총 결제금액 <span id="total_money"></span> 원</p> 			
			<div id="accountTransfer">
					<table border="1">
						<tr>
							<td>은행</td>
							<td>
								<label><input type="radio" name="bank" value="신한" checked="checked"/>신한</label>
								<label><input type="radio" name="bank" />우리</label>
								<label><input type="radio" name="bank" />농협</label>
							</td>
						</tr>
						<tr>
							<td>출금계좌</td>
							<td><input type="text" class="input" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" class="input" /></td>
						</tr>
						<tr>
							<td>예금주</td>
							<td><input type="text" class="input"/></td>
						</tr>
						<tr>
							<td colspan="2">환불</td>
						</tr>
						<tr>
							<td>은행</td>
							<td>
								<label><input type="radio" name="r_bank" value="신한" checked="checked"/>신한</label>
								<label><input type="radio" name="r_bank" value="우리"/>우리</label>
								<label><input type="radio" name="r_bank" value="농협"/>농협</label>
							</td>
						</tr>
						<tr>
							<td>환불계좌</td>
							<td><input type="text" id="r_ac_num" class="input"/></td>
						</tr>
						<tr>
							<td>예금주</td>
							<td><input type="text" id="r_ac" class="input"/></td>
						</tr>
					</table>	    	
			</div>
			
		<div id="creditCard" style="display:none">
			<table border="1">
				<tr>
					<td>
					    <select id="selectCard">
					    	<option value="선택하세요" >선택하세요</option>
					    	<option value="BC카드">BC카드</option>
					    	<option value="국민카드">국민카드</option>
					    	<option value="신한카드">신한카드</option>
					    </select>
				    </td>
					<td>
						<input type="text" class="input" /> - <input type="text" class="input" /> - <input type="text" class="input" /> - <input type="text" class="input" />
			  		</td>
				</tr>
			</table>	
		</div>
	</div>
	
</body>
</html>