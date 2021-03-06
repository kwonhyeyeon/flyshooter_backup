<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			
			<h2 class="articleTit">환불 상세 페이지</h2>
			
			<section class="itemArea">
			
				<input type="hidden" id="address" value="${data.p_address}" />
				<table class="detailTbl">
					<tr>
						<th>구장명</th>
						<td>${data.p_name}</td>
						<th>구장 전화번호</th>
						<td>${data.p_phone}</td>
					</tr>
					<tr>
						<th>구장 주소</th>
						<td colspan="3" id="adrs"></td>
					</tr>
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					<tr>
						<th>회원 ID</th>
						<td colspan="3">${data.m_id}</td>
					</tr>
					<tr>
						<th>신청자</th>
						<td>${data.m_name}</td>
						<th>연락처</th>
						<td>${data.m_phone}</td>
					</tr>
					<tr>
						<td colspan="4" class="blank"></td>
					</tr>
					<tr>
						<th>예약한 경기장</th>
						<td>${data.s_name}</td>
						<th>총 결제 금액</th>
						<td>${data.r_total_pay}</td>
					</tr>
					<tr>
						<th>결제 일자</th>
						<td>${data.r_regdate}</td>
						<th>예약 일자</th>
						<td>${data.r_reserve_date} ${data.r_start} 시 ~ ${(data.r_start + data.s_hours)} 시</td>
					</tr>
					
					<tr>
						<th>환불 신청일</th>
						<td>${data.r_recall_time}</td>
						<th>환불 금액</th>
						<td>${data.refund}</td>
					</tr>
					<tr>
						<th>환불 유형</th>
						<c:if test="${data.r_pay_type == 2}">
							<td>환불 대기</td>
						</c:if>
						<c:if test="${data.r_pay_type == -1}">
							<td>환불 완료</td>
						</c:if>
						<th>은행명</th>
						<td>${data.r_bank}</td>
					</tr>
					<tr>
						<th>예금주명</th>
						<td>${data.r_account}</td>
						<th>계좌번호</th>
						<td>${data.r_account_num}</td>
					</tr>
				</table>
			</section>
			
			<div class="tblBtnArea">
				<a href="javascript:history.back();" class="active">확인</a>
			</div>
			
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
		
</body>
<script>
	var address = $("#address").val();
	address = address.split("*");
	console.log(address);
	
	var postcode = address[0];
	var adrs = address[1];
	var detailadrs = address[2];
	var extraadrs = address[3];
	
	$("#adrs").html("(" + postcode + ")" + "&nbsp;" + adrs + "&nbsp;" + detailadrs + "&nbsp;" + extraadrs);
</script>
</html>