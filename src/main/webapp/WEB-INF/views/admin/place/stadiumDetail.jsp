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
                    <h2 class="con-subject">${svo.s_name} 경기장 상세 정보</h2>

					<!-- 경기장 승인 상태 변경을 위한 폼 -->
	                <form name="stdmAccept" id="stdmAccept">
                    	<input type="hidden" name="s_no" id="s_no" value="${svo.s_no}" />
                    	<input type="hidden" name="p_ok" id="actok" value="${p_ok}" />
                    	<input type="hidden" name="p_status" id="actstatus" value="${p_status}" />
                    </form>
	                        
                    <!-- 경기장 정보 -->
                    <table class="table-style2">
                        <tr>
                            <td class="subject">경기장명</td>
                            <td>${svo.s_name}</td>
                        </tr>
                        <tr>
                            <td class="subject">사업자번호</td>
                            <td>${svo.p_num}</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 등록일</td>
                            <td>${svo.s_regdate}</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 크기</td>
                            <td>${svo.s_size}</td>
                        </tr>
                        <tr>
                            <td class="subject">수용 인원</td>
                            <td>${svo.s_people} 명</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 실내/외</td>
                            <c:if test="${svo.s_in_out == 1}">
                            	<td>실내</td>
                            </c:if>
                            <c:if test="${svo.s_in_out == 2}">
                            	<td>실외</td>
                            </c:if>
                        </tr>
                        <tr>
                            <td class="subject">경기장 상태</td>
                            <c:if test="${svo.s_status == 0}">
                            	<td class="red">미승인</td>
                            </c:if>
                            <c:if test="${svo.s_status == 1}">
                            	<td>승인</td>
                            </c:if>
                        </tr>

                        <tr>
                            <td class="subject">경기장 최소 이용 시간</td>
                            <td>${svo.s_hours} 시간</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 평일 주간 요금</td>
                            <td><fmt:formatNumber value="${svo.s_d_fee}" pattern="#,###"/> 원</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 평일 야간 요금</td>
                            <td><fmt:formatNumber value="${svo.s_n_fee}" pattern="#,###"/> 원</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 주말 주간 요금</td>
                            <td><fmt:formatNumber value="${svo.s_d_fee_w}" pattern="#,###"/> 원</td>
                        </tr>
                        <tr>
                            <td class="subject">경기장 주말 야간 요금</td>
                            <td><fmt:formatNumber value="${svo.s_n_fee_w}" pattern="#,###"/> 원</td>
                        </tr>
					    	
                        <tr class="btn-area">
		                    <td><a class="cancle" href="javascript:history.back();">취소</a></td>
		                    <td class="positive">
		                    	<c:if test="${svo.s_status == 0}">
		                    		<button id="accept" class="add ml">경기장 승인</button>
		                    	</c:if>
		                    </td>
		                </tr>
                    </table>
                    <!-- 경기장 상세 정보 -->

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