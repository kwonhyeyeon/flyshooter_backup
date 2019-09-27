<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>

$(document).ready(function() {
	$(document).on("click",".cal_update",function(){
		var index = $(".cal_update").index(this);
		var p_num =  $(this).parents("tr").attr("data-num");
		var c_no = $(".cal_update:eq("+index+")").parent().parent().children('.indexC_no').text();
		query = {'p_num' : p_num,
				'c_no' : c_no
				};
		if (confirm('지급 하시겠습니까?')) {
			$.ajax({
				url : "/admin/place/adminCalculateUpdate.do",
				type : "get",
				data : query,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					if (resultData == '1') {
						alert('지급 완료');
						location.href = "/admin/place/adminCalculateList.do"
						return false;
					}else{
						alert('지급 실패');
					}
					}
			});
		}
	});
	
	$(document).on("change","#statusChoice",function(){
		var statusChoice = $("#statusChoice").val();
		var i = $("#hiddenChoice").val(statusChoice);
		$("#f_search").attr({
			"method":"get",
			"action":"/admin/place/adminCalculateList.do"
		});
		
		$("#f_search").submit();
	});
	var errCode = "${errCode}";
	//에러코드 검사
	//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
	if (parseInt(errCode) == 1) {
		alert("페이지에 오류가 발생하였습니다. \n잠시 후 다시 시도해 주세요");
		return false;
	}
});
function goPage(page){
	$("#page").val(page);
	$("#f_search").attr({
		"method":"get",
		"action":"/admin/place/adminCalculateList.do"
	});
	
	$("#f_search").submit();
}

</script>
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
            	<h2 class="con-subject">정산 관리</h2>
            	<!-- 셀렉트 박스 영역 -->
			    <div class="select-area">
			    	<form id="placeStatusForm">
				        <select name="statusChoice" id="statusChoice">
				        		<c:choose>
									<c:when test="${data.statusChoice == '0'}">
										<option value="0" selected>구장 상태 전체</option>
							            <option value="1">정산 대기</option>
							            <option value="2">정산 완료</option>
									</c:when>
									<c:when test="${data.statusChoice == '1'}">
										<option value="0">구장 상태 전체</option>
							            <option value="1" selected>정산 대기</option>
							            <option value="2">정산 완료</option>
									</c:when>
									<c:otherwise>
										<option value="0">구장 상태 전체</option>
							            <option value="1">정산 대기</option>
							            <option value="2" selected>정산 완료</option>
									</c:otherwise>
								</c:choose>
				        </select>
			        </form>
			    </div>
			    <!-- 셀렉트 박스 영역 -->
	            <div>
	            <!-- 구장 리스트 -->
	            	 <table class='table-style'> 
						 <tr>
							 <th>번호</th>
							 <th>신청일</th>
							 <th>회원 ID</th>
							 <th>대표자명</th>
							 <th>대관 건수</th>
							 <th>환불 건수</th>
							 <th>지급액</th>
							 <th>지급일</th>
							 <th>지급 상태</th>
						 </tr>
						 <c:if test="${ not empty calculateList }">
								<c:forEach var="calculate" items="${calculateList }">
									<tr class='calculate' data-num = "${ calculate.p_num }">
										<td class='indexC_no'>${ calculate.c_no }</td>
										<td>${ calculate.c_regdate }</td>
										<td>${ calculate.m_id }</td>
										<td>${ calculate.p_ceo }</td>
										<td>${ calculate.c_rental_cnt }</td>
										<td>${ calculate.c_return_cnt }</td>
										<td>${ calculate.c_payment }</td>
										
										<c:if test="${calculate.c_status == '-1'}">
											<td>
											  	정산 대기
											</td>
											<td>
											  	<input type='button' value='지급 대기' class='cal_update'/>
											</td>
										</c:if>
										<c:if test="${calculate.c_status == '1'}">
											<td>
											  	${ calculate.c_payment_date }
											</td>
											<td>
											  	<input type='button' value='지급 완료'/>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty calculateList }">
								<tr class="list-hover">
				                   <td class="empty" colspan="7">조회된 정산이 없습니다</td>
				                </tr>
						    </c:if>
						</table>
						<!-- 정산 리스트 -->
	           		 </div>
	             
				   <!--  paging view -->    
        			 <div id="boardSearch">
        				<form id="f_search" name="f_search">
        					<input type="hidden" id="page" name="page" value="${data.page }"/>
        					<input type="hidden" id="hiddenChoice" name="statusChoice" value="${data.statusChoice }"/>
        					<input type="hidden" id="p_ceo" name="p_ceo" value="${data.p_ceo }"/>
        				</form>
        			</div>
	            	<div class="pagination">
        				<tag:paging page="${data.page }" total="${total }" list_size="${data.pageSize }" />
        			</div> 
        			 <!-- 검색 -->
				    <div class="search">
					    <form action="/admin/place/adminCalculateList.do" method="get">
					        <input type="search" name="p_ceo" class="search-field" placeholder="대표자명" />
					        <button type="submit" class="search-btn">찾기</button>
					     </form> 
				    </div>
				    <!-- 검색 -->
            	</article>
            </div><!-- container -->

        </div><!-- con_wrap -->
	
	</div>
</body>
</html>