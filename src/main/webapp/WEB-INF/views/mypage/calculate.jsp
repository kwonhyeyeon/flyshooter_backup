<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/calculate.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>

	<div id="wrapper">
		
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">정산 관리</h2>
			
			<section class="itemArea">
				
				<div class="notice">
					<p><strong>Fly Shooter</strong>는 예약 일자가 <span class="red">15일 지난 건</span>을 기준으로 매출을 인식합니다.</p>
					<p>매출 금액에서 판매 수수료와 공제금액 등을 제외한 나머지를 정산합니다.</p>
					<p>지급 승인일 이후 <span class="red">15영업일</span>에 지급합니다.</p>
					<p>고객 문의와 관련하여 별도 협의한 정산 금액은 15일 또는 말일에 추가 지급합니다.</p>
				</div>
				
				<form action="/mypage/calculateInsert.do" method="post" id="calculateIn">
					<input type="hidden" name="p_num" id="p_num"/>
					<input type="hidden" name="c_rental_cnt" id="c_rental_cnt"/>
					<input type="hidden" name="c_return_cnt" id="c_return_cnt"/>
					<input type="hidden" name="c_payment" id="c_payment"/>
				</form>
				
				<!-- 신청할 수 있는 정산 내역 -->
				<h3 class="calTit">신청 가능한 정산 내역</h3>
				<table class="listTbl">
					<tr class="bgTr">
						<th>구장명</th>
						<th>사업자번호</th>
						<th>대관 건수</th>
						<th>환불 건수</th>
						<th>지급액</th>
						<th></th>
					</tr>
					<c:choose>
						<c:when test="${not empty calculateIList}">
							<c:forEach var="calculateIList" items="${calculateIList}" varStatus="status">
								<tr class="calculateIList" data-num="${calculateIList.p_num},${calculateIList.c_rental_cnt},${calculateIList.c_return_cnt},${calculateIList.c_payment}">
									<td>${calculateIList.p_name}</td>
									<td>${calculateIList.p_num}</td>
									<td>${calculateIList.c_rental_cnt}</td>
									<td>${calculateIList.c_return_cnt}</td>
									<td>${calculateIList.c_payment}</td>
									<td><button class="btninTbl calculateInsert">정산 신청</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">해당 아이디에 정산신청가능 내역이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				
				<h3 class="calTit" style="margin-top:100px;">신청한 정산 내역</h3>
				<table class="listTbl">
					<tr class="bgTr">
						<th>구장명</th>
						<th>대관 건수</th>
						<th>환불 건수</th>
						<th>지급액</th>
						<th>정산 상태</th>
						<th>지급 신청일</th>
					</tr>
					<c:choose>
						<c:when test="${not empty calculateList}">
							<c:forEach var="calculate" items="${calculateList}" varStatus="status">
								<tr class="calculateList" data-num="${calculate.p_num}">
									<td>${calculate.p_name}</td>
									<td>${calculate.c_rental_cnt}</td>
									<td>${calculate.c_return_cnt}</td>
									<td>${calculate.c_payment}</td>
									<c:if test="${calculate.c_status eq '-1'}">
										<td class="red">지급 대기</td>
									</c:if>
									<c:if test="${calculate.c_status eq '1'}">
										<td class="blue">지급 완료</td>
									</c:if>
									<td>${calculate.c_regdate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">정산 신청 내역이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				
			</section>
			
			<div class="pagination">
	        	<tag:paging page="${data.page }" total="${total }" list_size="${data.pageSize }" />
	        </div> 
		    
		</article>
			
		<jsp:include page="../templates/footer.jsp" flush="true" />
	
	</div>
</body>
</html>