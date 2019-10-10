<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet"  href="/resources/css/reset.css" />
<link rel="stylesheet"  href="/resources/css/style.css" />

<!-- datepicker를 사용하기 위한 css, js -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- end datepicker -->
<script type="text/javascript" src="/resources/js/rentalStadium.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCtzXWTJTZ4tnfXjE2yVo3YjQndGozENJQ&callback=initMap"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/jquery.flexslider.js"></script>

</head>
<body>
	<div id="wrapper">
		
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
		
			<h2 class="articleTit">경기장 예약</h2>
			
			<section class="itemArea rentalInfo">
			
				<table class="detailTbl">
					<tr>
						<th>구장명</th>
						<td>${ pvo.p_name }</td>
					</tr>
					<tr>
						<th>구장 주소</th>
						<td>${ pvo.p_address }</td>
					</tr>
					<tr>
						<th>구장 전화번호</th>
						<td>${ pvo.p_phone }</td>
					</tr>
					<tr>
						<th>영업 시간</th>
						<td>${ pvo.p_open } ~ ${ pvo.p_close } 시</td>
					</tr>
					
					<tr>
						<th>환불 규정</th>
						<td>
							<div class="notice nomargin">
								<p>이용 11일 전 : 취소 수수료 없음</p>
								<p>이용 6 ~ 10일 전 : 총 결제 금액의 30% 차감</p>
								<p>이용 2 ~ 5일 전 : 총 결제 금액의 40% 차감</p>
								<p>이용 1일 전 : 총 결제 금액의 50% 차감</p>
								<p>이용 당일 : 취소 불가 </p>
							</div>
						</td>
					</tr>
				</table>
				
				<section class="placeInfo">
					<div class="slide-wrap">
						<ul class="slides">
					    	<li><img src="/resources/img/noimg.jpg"></li>
					    	<li><img src="/resources/img/noimg.jpg"></li>
					    </ul>
				    </div>
			    </section>
			</section>
			
			<!-- <article id="map"> 
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
					
					</article> -->
			
	<!-- 경기장 예약 -->
	<div class="stadiumRental">
		
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
							<td><input type="text" id="datepicker" name="datepicker" readonly="readonly" placeholder="날짜를 선택하세요"/></td>
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
						<input type="hidden" value="${ itemsList.size() }" id="items_ec" placeholder="0"/>
					</c:if>
				</div>
				
				<p>옵션  <span id="itemsPrice">0</span> 원</p>
				<p>대관료 <span id='payment'>0</span> 원</p>
				<p>총 결제금액  <span id="totalMoney">0</span> 원</p>
				
				<div id='goRental'>
	 				<button id='goRentalBtn'>결제</button>
	  			</div>				
			</div>
		</div>
		<!-- 경기장 예약 -->
		
	
	<div id="dialog" title="결제창" style="display: none">
		<form id="insertRentalForm" >
			<input type="hidden" id="r_reserve_date" name="r_reserve_date" />
			<input type="hidden" id="s_no" name="s_no" />
			<input type="hidden" id="r_start" name="r_start" />
			<input type="hidden" id="r_total_pay" name="r_total_pay" />
			<input type="hidden" id="r_pay_type" name="r_pay_type"/>
			<input type="hidden" id="r_bank" name="r_bank" />	
			<input type="hidden" id="r_account_num" name="r_account_num"/>
			<input type="hidden" id="r_account" name="r_account"/>		
			<input type="hidden" id="items_no" name="items_no"/>
			<input type="hidden" id="items_ea" name="items_ea"/>
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
							<td><input type="text" class="input" id="outNum" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" class="input" id="outPw"/></td>
						</tr>
						<tr>
							<td>예금주</td>
							<td><input type="text" class="input" id="outName"/></td>
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
						<input type="text" class="cardNum" /> - <input type="text" class="cardNum" /> - <input type="text" class="cardNum" /> - <input type="text" class="cardNum" />
			  		</td>
				</tr>
			</table>	
		</div>
	</div>
	
		</article>
	<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
</body>
<script type="text/javascript">
    $(window).load(function(){
      $(".slide-wrap").flexslider({
        animation: "slide",
        pauseOnHover:true,
        start: function(slider){
        }
      });
    });
</script>
</html>