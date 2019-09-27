<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FLY SHOOTER</title>

<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/myRentalList.js"></script>
<script>
	$(function() {
		$("#gnb").hover(function() {
			$(".menu-wrap").slideDown(500);
		});
		$(".menu-wrap").mouseleave(function() {
			$(".menu-wrap").slideUp(500);
		});
	})
	
	function goPage(page){
		$("#page").val(page);
		$("#f_search").attr({
			"method":"get",
			"action":"/user/rental/myRentalList.do"
		});
		
		$("#f_search").submit();
	}
	
	function goBack(){
		location.href = "/user/rental/myRentalList.do";
	}
</script>
</head>
<body>
	<div id="wrapper">

		<div id="header-wrap">
			<jsp:include page="../templates/header.jsp" flush="true" />
		</div>
		
		<div class="sub-v"></div>
		
		<article id="contents">
			<h2>나의 예약정보</h2>
			<hr />
			<table>
				<tr>
					<td>구장명</td>
					<td>${data.p_name }</td>
					<td colspan="2" rowspan="5">경기장img</td>
				</tr>
				<tr>
					<td>구장 주소</td>
					<td>${data.p_address }</td>
				</tr>
				<tr>
					<td>구장 P.H</td>
					<td>${data.p_phone }</td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td>${data.r_total_pay }</td>
				</tr>
				<tr>
					<td>구장 소개</td>
					<td>${data.p_intro }</td>
				</tr>
				<tr>
					<td>환불 규정</td>
					<td colspan="3">
						이용 11일전 : 취소 수수료 없음<br />
						이용 6 ~ 10일전 : 총 결제금액의 30% 차감 <br />
						이용 2 ~ 5일전 : 총 결제금액의 40% 차감 <br />
						이용 1일전 : 총 결제금액의 50% 차감<br />
						이용 당일 : 취소 불가 
					</td>
				</tr>
				<tr>
					<td>신청자</td>
					<td>${data.m_name }</td>
					<td>연락처</td>
					<td>${data.m_phone }</td>
				</tr>
				<tr>
					<td>예약일자</td>
					<td>${data.r_regdate }</td>
					<td>예약시간</td>
					<td>${data.r_reserve_date }(${data.r_start}~${data.s_hours + data.r_start }시)</td>
				</tr>
				<tr>
					<td>경기장</td>
					<td>${data.s_name }</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>대여용품</td>
					<td colspan="3">
						<c:if test="${empty itemsList }">
							<p>대여하신 용품이 없습니다.</p>
						</c:if> 
						<c:if test="${not empty itemsList }">
							<c:forEach var="item" items="${ itemsList }">
								<p>${ item.i_name } <span>${ item.ir_rental_ea } 개   </span><span> 대여금액 : ${ item.i_rental_fee } 원</span> </p>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${data.r_pay_status == 1 }">
						<!-- 대관완료 -->
						<button id="cancleRental">예약취소</button>
						</c:if>
					</td>
					<td colspan="2"><button id="goList" onclick="goBack();">확인</button></td>
				</tr>			
			</table>
			<input type="hidden" id="r_reserve_date" value="${data.r_reserve_date }" />
			<input type="hidden" id="r_total_pay" value="${data.r_total_pay }" />
			
			<form id="goUpdate" method="post" action="/user/rental/rentalUpdate.do">
				<input type="hidden" name="r_no" value="${data.r_no }"/>
				<input type="hidden" id="refund" name="refund" />
				<input type="hidden" name="page" value="${page }" />
			</form>
		</article>
		
	</div>
		
</body>
</html>