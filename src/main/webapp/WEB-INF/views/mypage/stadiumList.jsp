<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장/구장 페이지</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/stadiumList.js"></script>
<script>
	$(document).ready(function() {
		//아이디 중복 여부 여부 확인
		$("#placeChoice").change(function() {

			var query = {
				p_num : $("#placeChoice").val()
			};

			$.ajax({
				url : "/mypage/stadiumList.do",
				type : "get",
				data : query,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					alert('확인');
					$("#stadiumList").text("");
					$("#stadiumList").append(resultData);
				}
			});

		});
	});
</script>
<script type="text/javascript">
   $(document).ready(function(){
      //페이지 로드..
      $(".tab_content").hide();//content 모두 숨김
      $("ul.tabs li:first").addClass("active").show();
      $(".tab_content:first").show();
      
      
      $("ul.tabs li").click(function(){
         $("ul.tabs li").removeClass("active");
         $(this).addClass("active");
         $(".tab_content").hide();
         
         var activeTab = $(this).find("a").attr("href");
         $(activeTab).fadeIn();
         return false;
      });
   });
</script>
</head>
<body>
		<div id="wrapper">
			<ul class="tabs">
				<li><a href="#tab1">경기장</a></li>
				<li><a href="#tab2">용품</a></li>
			</ul>
			<!-- 탭 콘텐츠 영역 -->
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<!-- Content -->
					<h1>경기장영역</h1>
					<div class="contentContainer">
						<div>
							<c:choose>
								<c:when test="${not empty placeChoice}">
									<select name="placeChoice" id="placeChoice">
										<c:forEach var="place" items="${placeChoice}">
											<option value="${place.p_num}">${place.p_name}</option>
										</c:forEach>
									</select>
								</c:when>
								<c:otherwise>
									<p>등록된 구장이 존재하지 않습니다.</p>
									<input type="button" value="구장 등록" id="placeInsert">
								</c:otherwise>
							</c:choose>
						</div>
						<%--==상세 페이지 이동을 위한 FORM --%>
						<form id="datailForm" action="/mypage/stadiumDetail.do" method="post">
							<input type="hidden" name="s_no" id="s_no">
						</form>
						
						<div id="stadiumList"></div>
					</div>
				</div>
					
				<div id="tab2" class="tab_content">
					<!-- Content -->
					<h1>용품 내역</h1>
					용품내용
				</div>
			</div>
   		</div>
	
</body>
</html>