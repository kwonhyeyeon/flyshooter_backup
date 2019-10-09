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
<script type="text/javascript" src="/resources/js/common.js"></script>
<script>
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

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			
			<h2 class="articleTit">나의 예약 정보</h2>
			
			<section class="itemArea rentalInfo">
				
				<section class="placeInfo">
					<div class="stadiumImgArea">
						경기장img
					</div>
					
					<div>
						<h3>구장 소개</h3>
						${data.p_intro }
					</div>
				</section>
				
				<input type="hidden" id="r_reserve_date" value="${data.r_reserve_date }" />
				<input type="hidden" id="r_total_pay" value="${data.r_total_pay }" />
				<table class="detailTbl">
					<tr>
						<th>구장명</th>
						<td>${data.p_name}</td>
					</tr>
					<tr>
						<th>구장 주소</th>
						<td>${data.p_address }</td>
					</tr>
					<tr>
						<th>구장 전화번호</th>
						<td>${data.p_phone }</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>총 결제 금액</th>
						<td>${data.r_total_pay }</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>신청자</th>
						<td>${data.m_name }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${data.m_phone }</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>경기장</th>
						<td>${data.s_name }</td>
					</tr>
					<tr>
						<th>예약 일자</th>
						<td>${data.r_regdate }</td>
					</tr>
					<tr>
						<th>예약 시간</th>
						<td>${data.r_reserve_date } (${data.r_start} ~ ${data.s_hours + data.r_start }시)</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>대여 용품</th>
						<td>
							<c:if test="${empty itemsList }">대여하신 용품이 없습니다</c:if> 
							<c:if test="${not empty itemsList }">
								<c:forEach var="item" items="${ itemsList }">${item.i_name} ${ item.ir_rental_ea }개 
								대여금액 : ${ item.i_rental_fee }원
								</c:forEach>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>결제 금액</th>
						<td>${data.r_total_pay }</td>
					</tr>
					
					<tr>
						<th>환불 규정</th>
						<td>
							이용 11일전 : 취소 수수료 없음<br />
							이용 6 ~ 10일전 : 총 결제금액의 30% 차감 <br />
							이용 2 ~ 5일전 : 총 결제금액의 40% 차감 <br />
							이용 1일전 : 총 결제금액의 50% 차감<br />
							이용 당일 : 취소 불가 
						</td>
					</tr>		
				</table>
			
			</section>
			
			<!-- 예약 취소 폼 -->
			<form id="goUpdate" method="post" action="/user/rental/rentalUpdate.do">
				<input type="hidden" name="r_no" value="${data.r_no }"/>
				<input type="hidden" id="refund" name="refund" />
				<input type="hidden" name="page" value="${page }" />
			</form>
			<div class="tblBtnArea space-between">
				<c:if test="${data.r_pay_status == 1 }">
					<!-- 대관 완료 -->
					<button id="cancleRental">예약 취소</button>
				</c:if>
			
				<a href="javascript:history.back();" class="active">확인</a>
			</div>
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
		
</body>
</html>