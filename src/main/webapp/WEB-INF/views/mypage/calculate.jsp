<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산 페이지</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/calculate.js"></script>
</head>
<body>

	<div id="header-wrap">
		<jsp:include page="../templates/header.jsp" flush="true" />
	</div>

	<div class="sub-v"></div>

	<div id="contents">
		<div>
		<p>
		Fly Shooter은 예약일자가 15일 지난 예약을 기준으로 매출을 인식합니다. <br />
		매출금액에서 판매수수료와 공제금액 등을 제외한 나머지를 정산합니다. <br />
		지급승인일 이후 15 영업 일에 지급합니다. <br />
		고객문의와 관련하여 별도 협의한 정산금액은15일 또는 말 일에 추가 지급합니다.
		</p>
		</div>
		<div id="calculateIList">
			<table>
				<tr>
					<th>구장 명</th>
					<th>사업자번호</th>
					<th>대관 건수</th>
					<th>환불 건수</th>
					<th>지급액</th>
					<th></th>
				</tr>
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty calculateIList}">
						<c:forEach var="calculateIList" items="${calculateIList}" varStatus="status">
							<tr class="calculateIList" data-num="${calculateIList.p_num},${calculateIList.c_rental_cnt},${calculateIList.c_return_cnt},${calculateIList.c_payment}">
								<td>${calculateIList.p_name}</td>
								<td>${calculateIList.p_num}</td>
								<td>${calculateIList.c_rental_cnt}</td>
								<td>${calculateIList.c_return_cnt}</td>
								<td>${calculateIList.c_payment}</td>
								<td><input type="button" value="정산 신청" class="calculateInsert"/></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="tac">해당 아이디에 정산신청가능 내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<form action="/mypage/calculateInsert.do" method="post" id="calculateIn">
				<input type="hidden" name="p_num" id="p_num"/>
				<input type="hidden" name="c_rental_cnt" id="c_rental_cnt"/>
				<input type="hidden" name="c_return_cnt" id="c_return_cnt"/>
				<input type="hidden" name="c_payment" id="c_payment"/>
			</form>
		</div>
		<div id="placeList">
			<table>
				<tr>
					<th>구장 명</th>
					<th>대관 건수</th>
					<th>환불 건수</th>
					<th>지급액</th>
					<th>정산 상태</th>
					<th>지급 신청일</th>
				</tr>
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty calculateList}">
						<c:forEach var="calculate" items="${calculateList}" varStatus="status">
							<tr class="calculateList" data-num="${calculate.p_num}">
								<td>${calculate.p_name}</td>
								<td>${calculate.c_rental_cnt}</td>
								<td>${calculate.c_return_cnt}</td>
								<td>${calculate.c_payment}</td>
								<td>
								<c:if test="${calculate.c_status eq '-1'}">
								<p style="color: red;">지급 대기</p>
								</c:if>
								<c:if test="${calculate.c_status eq '1'}">
								<p style="color: blue;">지급 완료</p>
								</c:if>
								</td>
								<td>${calculate.c_regdate}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="tac">해당 아이디에 정산신청 내역이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<!--  paging view -->    
        <div id="boardSearch">
        <form id="f_search" name="f_search">
        	<input type="hidden" id="page" name="page" value="${data.page }"/>
        	<input type="hidden" id="p_name" name="p_name" value="${data.p_name }"/>
        </form>
        </div>
	    <div class="pagination">
        	<tag:paging page="${data.page }" total="${total }" list_size="${data.pageSize }" />
        </div> 
	</div>
</body>
</html>