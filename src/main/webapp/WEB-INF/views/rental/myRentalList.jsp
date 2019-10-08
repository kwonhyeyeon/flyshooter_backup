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
<script type="text/javascript" src="/resources/js/myRentalList.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>
   <div id="wrapper">

      <jsp:include page="../templates/header.jsp" flush="true" />
      
      <article id="contents">
      
         <h2 class="articleTit">나의 예약 현황</h2>
         
         <section class="itemArea">
	         <form id="myRentalList" style="display: none">
	            <input type="hidden" name="page" value="${data.page }" />
	            <input type="hidden" name="r_no" id="r_no"/>
	         </form>
	         
	         <table class="listTbl">         
	            <c:if test="${ not empty myList }">
	               <tr class="bgTr">
	                  <th>글번호</th>
	                  <th>구장명 [경기장명]</th>
	                  <th>예약일</th>
	                  <th>결제 금액</th>
	                  <th>신청일</th>
	                  <th>진행 상태</th>
	               </tr>
	               <c:forEach var="rental" items="${ myList }" varStatus="status">
	                  <tr class="goDetail" data-num="${rental.r_no }">
	                     <td>${ count - status.index }</td>
	                     <td>${ rental.r_account } [${ rental.r_bank }]</td>
	                     <td>${ rental.r_reserve_date } (${ rental.r_start }시 ~ ${ rental.r_pay_type + rental.r_start}시)</td>
	                     <td><fmt:formatNumber value="${ rental.r_total_pay }" pattern="#,###"/> 원</td>
	                     <td>${ rental.r_regdate }</td>
	                     <td>
	                        <c:choose>
	                           <c:when test="${rental.r_pay_status == '1'}">대관완료</c:when>
	                           <c:when test="${rental.r_pay_status == '2'}">환불대기중</c:when>
	                           <c:when test="${rental.r_pay_status == '-1'}">환불완료</c:when>
	                        </c:choose>
	                     </td>
	                  </tr>
	               </c:forEach>
	            </c:if>   
	            
	            <c:if test="${ empty myList }">
	               <tr>
	                  <td colspan="6">대관된 내역이 없습니다.</td>
	               </tr>
	            </c:if>
	         </table>
         </section>
         
         <!--  paging view (start) -->    
	     <form id="f_search" name="f_search">
	     	<input type="hidden" id="page" name="page" value="${data.page }"/>
	     </form>
	                
	     <div class="pagination">
	        <tag:paging page="${param.page }" total="${total }" list_size="${data.pageSize }" />
	     </div> 
	     <!--  paging view (end) -->  
         
      </article>
      
      <jsp:include page="../templates/footer.jsp" flush="true" />
      
   </div>
      
</body>
<script>
   function goPage(page){
      $("#page").val(page);
      $("#f_search").attr({
         "method":"get",
         "action":"/user/rental/myRentalList.do"
      });
      
      $("#f_search").submit();
   }
   
   if("${massage}"){
      alert("${massage}");
   }
</script>
</html>