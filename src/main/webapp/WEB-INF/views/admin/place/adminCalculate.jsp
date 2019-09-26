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
	query = {'statusChoice' : 0
			};
	ACList(query);
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
						query = {'statusChoice' : 0
								};
						ACList(query);
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
		query = {'statusChoice' : statusChoice
				};
		ACList(query);
	});
	var errCode = "${errCode}";
	//에러코드 검사
	//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
	if (parseInt(errCode) == 1) {
		alert("페이지에 오류가 발생하였습니다. \n잠시 후 다시 시도해 주세요");
		return false;
	}
});
function ACList(query) {
	$.ajax({
		url : "/admin/place/calculate.do",
		type : "get",
		data : query,
		error : function() {
			alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			$("#ACList").text("");
			$("#ACList").append(resultData);
			return false;
		}
	});
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
				            <option value="0">구장 상태 전체</option>
				            <option value="1">정산 대기</option>
				            <option value="2">정산 완료</option>
				        </select>
			        </form>
			    </div>
			    <!-- 셀렉트 박스 영역 -->
	            <div id="ACList">
	            	
	            </div>
	            
				    <!-- 검색 -->
				    <div class="search">
					    <form action="/admin/member/memberList.do" method="get">
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