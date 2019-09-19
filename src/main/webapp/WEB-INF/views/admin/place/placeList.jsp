<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER 관리자</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="/resources/js/adminPlace.js"></script>
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
            	
            		<h2 class="con-subject">구장 관리</h2>
            		
            		<!-- 셀렉트 박스 영역 -->
				    <div class="select-area">
				    	<form id="placeStatusForm">
					        <select name="p_status" class="placeStatus">
					            <option value="2">구장 상태 전체</option>
					            <option value="1">운영중</option>
					            <option value="0">운영전</option>
					            <option value="-1">임시휴업</option>
					            <option value="-2">폐업</option>
					        </select>
				        </form>
				    </div>
				    <!-- 셀렉트 박스 영역 -->
				    
				    <!-- 상세페이지 이동을 위한 폼 -->
				    <form name="detailForm" id="detailForm">
				    	<input type="hidden" name="p_num" id="p_num" />
				    </form>
				    <!-- 구장 리스트 -->
				    <table class="table-style">
				    	<tr>
				    		<th width="100">번호</th>
				    		<th width="350">회원 ID</th>
				    		<th width="150">대표자명</th>
				    		<th width="400">구장명</th>
				    		<th width="100">승인 상태</th>
				    		<th width="150">미승인 경기장 수</th>
				    		<th>등록일</th>
				    	</tr>
				    	<c:if test="${not empty adminPlaceList}">
				    		<c:forEach var="place" items="${adminPlaceList}" varStatus="status">
							   	<tr class="list-hover placeDetail" data-num="${place.p_num}">
								   	<%-- <td>${fn:length(adminPlaceList)-status.count+1}</td> --%>
								   	<td>${count-status.index}</td>
								   	<td>${place.m_id}</td>
								   	<td>${place.p_ceo}</td>
								   	<td>${place.p_name}</td>
								   	<c:if test="${place.p_ok == 1}">
								   		<td>Y</td>
								   	</c:if>
								   	<c:if test="${place.p_ok == 0}">
								   		<td>N</td>
								   	</c:if>
								   	<td>${place.p_holiday}</td>
								   	<td>${place.p_regdate}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty adminPlaceList}">
					    	<tr>
							   	<td class="empty" colspan="7">조회된 구장이 없습니다</td>
							</tr>
						</c:if>
				    </table>
				    <!-- 구장 리스트 -->
				    
				    <!-- pagination -->
				    <div id="boardSearch">
			           <form id="f_search" name="f_search">
			                 <input type="hidden" id="page" name="page" value="${data.page}"/>
			           </form>
			      	</div>
			                 
			        <div class="pagination">
			           <tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}" />
			        </div>
				    <!-- pagination -->
				    
				    <!-- 검색 -->
				    <div class="search">
				    	<form action="placeList.do" method="get">
					        <input type="search" name="p_name" class="search-field" placeholder="구장명" />
					        <button type="submit" class="search-btn">찾기</button>
				        </form>
				    </div>
				    <!-- 검색 -->
				    
            	</article><!-- contents -->
            </div><!-- container -->

        </div><!-- con_wrap -->
	
	</div>

</body>
<script>
	$(".placeStatus").val("${data.p_status}");
	$("${data.p_status}").text();

	function goPage(page){
	    $("#page").val(page);
	    $("#f_search").attr({
	       "method":"get",
	       "action":"/admin/place/placeList.do"
	    });
	    
	    $("#f_search").submit();
	}
</script>

</html>