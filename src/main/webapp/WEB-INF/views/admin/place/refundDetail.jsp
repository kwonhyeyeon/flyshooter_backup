<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/adminRefund.js"></script>
</head>

<body>

    <div id="wrapper">

        <div id="header-wrap">
            <div id="header">
                <h1 id="logo"><a href="/admin/main.do">FLY SHOOTER 관리자</a></h1>
                <c:if test="${not empty adminId}">
                    <a href="/admin/logout.do" class="logout">로그아웃</a>
                </c:if>
            </div><!-- header -->
        </div><!-- header-wrap -->

        <div id="content-wrap">
            <aside id="subNavi">
                <jsp:include page="../templates/subNavi.jsp" flush="true" />
            </aside><!-- subNavi -->

            <div id="container">
                <article id="contents">
                    <h2 class="con-subject">환불 상세 정보</h2>

					<!-- 환불 상태 변경을 위한 폼 -->
	                <form name="refundAccept" id="refundAccept">
                    	<input type="hidden" name="r_no" id="rno" value="${data.r_no}" />
                    	<input type="hidden" name="pay_status" id="status" value="${data.pay_status}" />
                    </form>
	                
	                <h3 class="sub-tit">구장 정보</h3>
                    <!-- 구장 정보 -->
                    <table class="table-style2">
                        <tr>
                            <td class="subject">ID</td>
                            <td>${data.client}</td>
                        </tr>
                        <tr>
                            <td class="subject">대표자명</td>
                            <td>${data.ceo}</td>
                        </tr>
                        <tr>
                            <td class="subject">환불 신청일</td>
                            <td>${data.recall_time}</td>
                        </tr>
                        <tr>
                            <td class="subject">총 결제금액</td>
                            <td><fmt:formatNumber value="${data.total_pay}" pattern="#,###"/> 원</td>
                        </tr>
                        <tr>
                            <td class="subject">환불 상태</td>
                            <c:if test="${data.pay_status == 2}">
                            	<td>환불 전</td>
                            </c:if>
                            <c:if test="${data.pay_status == -1}">
                            	<td>환불 완료</td>
                            </c:if>
                        </tr>
                        <c:if test="${data.pay_status == -1}">
                        	<tr>
	                            <td class="subject">지급일</td>
	                            <td>${data.refund_day}</td>
	                        </tr>
                        </c:if>
                        
                        <tr class="btn-area">
		                    <td><a class="cancle" href="javascript:history.back();">취소</a></td>
		                    <td class="positive">
		                    	<c:if test="${data.pay_status != -1}">
		                    		<button class="delete ml" id="refundBtn">환불액 지급</button>
		                    	</c:if>
		                    </td>
		                </tr>
                    </table>
                    <!-- 구장 정보 -->
                    
                    <h3 class="sub-tit">예약 내역</h3>
                    <!-- 예약 내역 -->
                    <table class="table-style2">
                        <tr>
                            <td class="subject">예약자 ID</td>
                            <td>${data.mem}</td>
                        </tr>
                        <tr>
                            <td class="subject">예약자명</td>
                            <td>${data.m_name}</td>
                        </tr>
                        <tr>
                            <td class="subject">예약자 휴대폰번호</td>
                            <td>${data.m_phone}</td>
                        </tr>
                        <tr>
                            <td class="subject">예약 일자</td>
                            <td>${data.regdate}</td>
                        </tr>
                        <tr>
                            <td class="subject">예약 시간</td>
                            <td>${data.reserve_date} (${data.start} ~ ${data.start + data.hours}) 시</td>
                        </tr>
                        <tr>
                            <td class="subject">구장 / 경기장명</td>
                            <td>${data.p_name} / ${data.s_name}</td>
                        </tr>
                        <tr>
                        	<td class="subject">결제 유형</td>
                        	<td>${data.pay_type}</td>
                        </tr>
                        <c:if test="${data.pay_type == 2}">
                        	<tr>
	                        	<td class="subject">은행명</td>
	                        	<td>${data.bank}</td>
	                        </tr>
	                        <tr>
	                        	<td class="subject">예금주명</td>
	                        	<td>${data.account}</td>
	                        </tr>
	                        <tr>
	                        	<td class="subject">계좌번호</td>
	                        	<td>${data.account_num}</td>
	                        </tr>
                        </c:if>
                    </table>
                    <!-- 예약 내역 -->

                </article><!-- contents -->
            </div><!-- container -->

        </div><!-- con_wrap -->

    </div>

</body>
<script>
    $("#acceptSelect").val("${pvo.p_ok}");
    $("${pvo.p_ok}").text();
</script>

</html>