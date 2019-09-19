<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                    <h2 class="con-subject">${pvo.p_name} 구장 상세 정보</h2>

                    <h3 class="sub-tit">구장 정보</h3>

					<!-- 구장 승인 상태 변경을 위한 폼 -->
	                <form name="saveForm" id="saveForm">
	                  	<input type="hidden" name="p_num" id="p_num" value="${pvo.p_num}" />
	                </form>
	                
	                <!-- 구장 폐업 등록을 위한 폼 -->
	                <form name="closeForm" id="closeForm">
	                	<input type="hidden" name="p_num" id="p_num" value="${pvo.p_num}" />
	                </form>
	                        
                    <!-- 구장 정보 -->
                    <table class="table-style2">
                        <tr>
                            <td class="subject">회원 ID</td>
                            <td>${pvo.m_id}</td>
                        </tr>
                        <tr>
                            <td class="subject">대표자명</td>
                            <td>${pvo.p_ceo}</td>
                        </tr>
                        <tr>
                            <td class="subject">사업자번호</td>
                            <td>${pvo.p_num}</td>
                        </tr>
                        <tr>
                            <td class="subject">구장명</td>
                            <td>${pvo.p_name}</td>
                        </tr>
                        <tr>
                            <td class="subject">구장 전화번호</td>
                            <td>${pvo.p_phone}</td>
                        </tr>
                        <tr>
                            <td class="subject">구장 주소</td>
                            <td>${pvo.p_address}</td>
                        </tr>

                        <tr>
                            <td class="subject">은행명</td>
                            <td>${pvo.p_bank}</td>
                        </tr>
                        <tr>
                            <td class="subject">예금주명</td>
                            <td>${pvo.p_account}</td>
                        </tr>
                        <tr>
                            <td class="subject">입금 계좌번호</td>
                            <td>${pvo.p_account_num}</td>
                        </tr>
						<!-- 파일첨부 1, 팩스 2, 등기 3, 메일 4 -->
						<!-- 파일 클릭 시 다운로드 될 수 있도록 구현 -->
						<c:if test="${pvo.p_file == '1'}">
	                        <tr>
	                            <td class="subject">서류 첨부 유형</td>
	                            <td>${pvo.p_file}</td>
	                        </tr>
	                        <tr>
	                            <td class="subject">사업자 등록증</td>
	                            <td>${pvo.p_register}</td>
	                        </tr>
	                        <tr>
	                            <td class="subject">통장 사본</td>
	                            <td>${pvo.p_account_copy}</td>
	                        </tr>
	                        <tr>
	                            <td class="subject">부동산 종합 공부</td>
	                            <td>${pvo.p_property}</td>
	                        </tr>
                        </c:if>

                        <tr>
                            <td class="subject">구장 운영 시간</td>
                            <td>${pvo.p_open}시 - ${pvo.p_close}시</td>
                        </tr>
                        <tr>
                            <td class="subject">구장 정기 휴일</td>
                            <td>
                            	<c:choose>
                            		<c:when test="${pvo.p_holiday == 0}">일요일</c:when>
                            		<c:when test="${pvo.p_holiday == 1}">월요일</c:when>
                            		<c:when test="${pvo.p_holiday == 2}">화요일</c:when>
                            		<c:when test="${pvo.p_holiday == 3}">수요일</c:when>
                            		<c:when test="${pvo.p_holiday == 4}">목요일</c:when>
                            		<c:when test="${pvo.p_holiday == 5}">금요일</c:when>
                            		<c:when test="${pvo.p_holiday == 6}">토요일</c:when>
                            		<c:when test="${pvo.p_holiday == 7}">연중무휴</c:when>
                            	</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td class="subject">구장 상태</td>
                            <c:if test="${pvo.p_status != -2 }">
                            	<td>
                            		<c:choose>
	                            		<c:when test="${pvo.p_status == 1}">운영중</c:when>
	                            		<c:when test="${pvo.p_status == 0}">운영전</c:when>
	                            		<c:when test="${pvo.p_status == -1}">임시휴업</c:when>
	                            		<c:when test="${pvo.p_status == -2}">폐업</c:when>
	                            	</c:choose>
                            	</td>
                            </c:if>
                            <c:if test="${pvo.p_status == -2 }">
                            	<td class="red">폐업</td>
                            </c:if>
                        </tr>
                        <c:if test="${pvo.p_status == -1}">
                        	<tr>
	                            <td class="subject">임시 휴업 시작일</td>
	                            <td>${pvo.p_holiday_start}</td>
	                        </tr>
	                        <tr>
	                            <td class="subject">영업 재개일</td>
	                            <td>${pvo.p_holiday_end}</td>
	                        </tr>
                        </c:if>
                        <c:if test="${pvo.p_status == -2}">
                        	<tr>
	                            <td class="subject">폐업 등록일</td>
	                            <td>${pvo.p_holiday_start}</td>
	                        </tr>
                        </c:if>
                        <c:if test="${pvo.p_status != -2 }">
                        	<tr>
	                            <td class="subject">구장 승인 상태</td>
	                            <c:if test="${pvo.p_ok == 0}">
	                            	<td id="placeAccept" class="red">미승인</td>
	                            </c:if>
	                            <c:if test="${pvo.p_ok == 1}">
	                            	<td id="placeAccept">승인</td>
	                            </c:if>
	                        </tr>
	                        <c:if test="${pvo.p_ok == 1}">
		                        <tr>
		                            <td class="subject">구장 승인일</td>
		                            <td>${pvo.p_ok_date}</td>
		                        </tr>
	                        </c:if>
                        </c:if>

                        <tr>
                            <td class="subject">소개글</td>
                            <td>${pvo.p_intro}</td>
                        </tr>
					    	
                        <tr class="btn-area">
		                    <td><a class="cancle" href="javascript:history.back();">취소</a></td>
		                    <td class="positive">
		                    	<c:if test="${pvo.p_status != -2}">
		                    		<button class="delete ml" id="rentalCnt" value="${rentalCnt}">폐업 등록</button>
		                    	</c:if>
		                    	<c:if test="${pvo.p_status != -2 and pvo.p_ok != 1}">
		                    		<button id="placeAcceptBtn" class="save ml">구장 승인</button>
		                    	</c:if>
		                    </td>
		                </tr>
                    </table>
                    <!-- 구장 상세 정보 -->
					
                    <h3 class="sub-tit">용품</h3>

                    <!-- 용품 정보 -->
                    <table class="table-style">
                        <tr>
                            <th width="100">번호</th>
                            <th width="600">용품명</th>
                            <th width="200">대여료</th>
                            <th width="200">용품 상태</th>
                            <th width="100">대여 횟수</th>
                            <th>용품 등록일</th>
                        </tr>
                        <c:if test="${not empty itemsList}">
                            <c:forEach var="items" items="${itemsList}" varStatus="status">
                                <tr>
                                    <td>${fn:length(itemsList)-status.count+1}</td>
                                    <td>${items.i_name}</td>
                                    <td>${items.i_rental_fee}</td>
                                    <c:if test="${items.i_status == 0}">
                                    	<td>미게시</td>
                                    </c:if>
                                    <c:if test="${items.i_status == 1}">
                                        <td>게시중</td>
                                    </c:if>
                                    <td>${items.i_use}</td>
                                    <td>${items.i_regdate}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty itemsList}">
                            <tr>
                                <td class="empty" colspan="6">조회된 용품이 없습니다</td>
                            </tr>
                        </c:if>
                    </table>
                    <!-- 용품 정보 -->

                    <h3 class="sub-tit">경기장</h3>
                    
                    <!-- 경기장 상세 정보 페이지로 가기 위한 폼 -->
                    <form name="stdmDetailForm" id="stdmDetailForm">
                    	<input type="hidden" name="s_no" id="s_no" />
                    	<input type="hidden" name="p_ok" value="${pvo.p_ok}" />
                    	<input type="hidden" name="p_status" value="${pvo.p_status}" />
                    </form>
                    <table class="table-style">
                    	<c:if test="${not empty stadiumList}">
                    		<c:forEach var="stdm" items="${stadiumList}" varStatus="status">
			                    <tr class="list-hover stadiumDetail" data-num="${stdm.s_no}">
			                    	<td width="100">${fn:length(stadiumList)-status.count+1}</td>
			                    	<td width="900">${stdm.s_name}</td>
			                    	<c:if test="${stdm.s_status == 0}">
			                    		<td class="red right">미승인</td>
			                    	</c:if>
			                    	<c:if test="${stdm.s_status == 1}">
			                    		<td class="right">승인</td>
			                    	</c:if>
			                    </tr>
		                    </c:forEach>
	                    </c:if>
	                    <c:if test="${empty stadiumList}">
	                   		<tr>
	                   			<td class="empty" colspan="3">조회된 경기장이 없습니다</td>
	                   		</tr>
	                    </c:if>
                    </table>
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