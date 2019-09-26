<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content=""> -->
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
            	
            		<h2 class="con-subject">환불 관리</h2>
            		
            		<!-- 셀렉트 박스 영역 -->
				    <div class="select-area">
				    	<form id="payStatusForm">
					        <select name="r_pay_status" class="payStatus">
					            <option value="0">환불 상태 전체</option>
					            <option value="2">환불전</option>
					            <option value="-1">환불완료</option>
					        </select>
				        </form>
				    </div>
				    <!-- 셀렉트 박스 영역 -->
				    
				    <!-- 상세페이지 이동을 위한 폼 -->
				    <form name="detailForm" id="detailForm">
				    	<input type="hidden" name="r_no" id="r_no" />
				    </form>
				    <!-- 구장 리스트 -->
				    <table class="table-style">
				    	<tr>
				    		<th width="100">번호</th>
				    		<th width="150">신청일</th>
				    		<th width="350">회원 ID</th>
				    		<th width="200">대표자명</th>
				    		<th width="250">총 결제금액</th>
				    		<th width="150">지급일</th>
				    		<th>환불 상태</th>
				    	</tr>
				    	<c:if test="${not empty refundList}">
				    		<c:forEach var="refund" items="${refundList}" varStatus="status">
							   	<tr class="list-hover detailRefund" data-num="${refund.r_no}">
								   	<%-- <td>${fn:length(adminPlaceList)-status.count+1}</td> --%>
								   	<td>${count-status.index}</td>
								   	<td>${refund.recall_time}</td>
								   	<td>${refund.client}</td>
								   	<td>${refund.ceo}</td>
								   	<td><fmt:formatNumber value="${refund.total_pay}" pattern="#,###"/> 원</td>
								   	<c:if test="${not empty refund.refund_day}">
								   		<td>${refund.refund_day}</td>
								   	</c:if>
								   	<c:if test="${empty refund.refund_day}">
								   		<td>-</td>
								   	</c:if>
								   	<c:if test="${refund.pay_status == 2}">
								   		<td>환불전</td>	
								   	</c:if>
								   	<c:if test="${refund.pay_status == -1}">
								   		<td>환불 완료</td>	
								   	</c:if>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty refundList}">
					    	<tr>
							   	<td class="empty" colspan="7">조회된 환불 내역이 없습니다</td>
							</tr>
						</c:if>
				    </table>
				    <!-- 구장 리스트 -->
				    
				    <!-- pagination -->
			        <form id="f_search" name="f_search">
			        	<input type="hidden" id="page" name="page" value="${data.page}"/>
			        </form>      
			        <div class="pagination">
			           <tag:paging page="${param.page}" total="${total}" list_size="${pageSize}" />
			        </div>
				    <!-- pagination -->
				    
				    <!-- 검색 -->
				    <%-- <div class="search">
				    	<form action="updateRefund.do" method="get">
					        <input type="search" name="p_ceo" class="search-field" placeholder="대표자명" />
					        <button type="submit" class="search-btn">찾기</button>
				        </form>
				    </div> --%>
				    <!-- 검색 -->
				    
            	</article><!-- contents -->
            </div><!-- container -->

        </div><!-- con_wrap -->
	
	</div>

</body>
<script>
$(".payStatus").val("${data.r_pay_status}");
$("${data.r_pay_status}").text();

function goPage(page){
    $("#page").val(page);
    $("#f_search").attr({
       "method":"get",
       "action":"/admin/place/updateRefund.do"
    });
    
    $("#f_search").submit();
}
</script>
</html>