<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
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
<script type="text/javascript" src="/resources/js/slides.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/jquery.flexslider.js"></script>
<script>
	function goPage(page){
		$("#page").val(page);
		$("#f_search").attr({
			"method":"get",
			"action":"/user/rental/myRentalList.do"
		});
		
		$("#f_search").submit();
	}
	
	function goBack(){
		location.href = "/user/rental/myRentalList.do";
	}
	
	
	function sendImg(){
		return "${data.s_img1}||${data.s_img2}||${data.s_img3}";
	}
</script>

</head>
<body>
	<div id="wrapper">

		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			
			<h2 class="articleTit">나의 예약 정보</h2>
			
			<section class="itemArea rentalInfo">
				<input type="hidden" id="r_reserve_date" value="${data.r_reserve_date }" />
				<input type="hidden" id="r_total_pay" value="${data.r_total_pay }" />
				
				<table class="detailTbl">
					<tr>
						<th>구장명</th>
						<td>${data.p_name}</td>
					</tr>
					<tr>
						<th>구장 주소</th>
						<td>${data.p_address }</td>
					</tr>
					<tr>
						<th>구장 전화번호</th>
						<td>${data.p_phone }</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>신청자</th>
						<td>${data.m_name }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${data.m_phone }</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>경기장</th>
						<td>${data.s_name }</td>
					</tr>
					<tr>
						<th>예약 일자</th>
						<td>${data.r_regdate }</td>
					</tr>
					<tr>
						<th>예약 시간</th>
						<td>${data.r_reserve_date } (${data.r_start} ~ ${data.s_hours + data.r_start }시)</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>대여 용품</th>
						<td>
							<c:if test="${empty itemsList }">대여하신 용품이 없습니다</c:if> 
							<c:if test="${not empty itemsList }">
								<c:forEach var="item" items="${ itemsList }">${item.i_name} ${ item.ir_rental_ea }개 
								대여금액 : ${ item.i_rental_fee }원
								</c:forEach>
							</c:if>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>결제 금액</th>
						<td>${data.r_total_pay }</td>
					</tr>
					
					<tr>
						<th>환불 규정</th>
						<td>
							<div class="notice nomargin">
								<p>이용 11일 전 : 취소 수수료 없음</p>
								<p>이용 6 ~ 10일 전 : 총 결제 금액의 30% 차감</p>
								<p>이용 2 ~ 5일 전 : 총 결제 금액의 40% 차감</p>
								<p>이용 1일 전 : 총 결제 금액의 50% 차감</p>
								<p>이용 당일 : 취소 불가 </p>
							</div>
						</td>
					</tr>
				</table>
				
				<section class="placeInfo">
					<div class="slide-wrap">
			            <ul class="slides">
				            <li><img id="img1" src="" /></li>
                        	<li><img id="img2" src="" /></li>
                        	<li><img id="img3" src="" /></li>
			            </ul>
		            </div>
		            <!--photo-slide-->
		            
		            <h3 class="calTit">구장 소개</h3>
		            <div class="notice"><p>${data.p_intro }</p></div>

				</section>
			
			</section>
			
			<div id="map" style="width:100%; height:400px; margin-bottom:50px;"></div>
            <!-- services 라이브러리 불러오기 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f706d5a384eb0508472eddd23b44d733&libraries=services"></script>
            <script>
            //var address = $("#adrsText").replace("*");
            var add = "${data.p_address }";
            var addressText = add.split("*");
            
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addressText[1], function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${data.p_name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
			
			<!-- 예약 취소 폼 -->
			<form id="goUpdate" method="post" action="/user/rental/rentalUpdate.do">
				<input type="hidden" name="r_no" value="${data.r_no }"/>
				<input type="hidden" id="refund" name="refund" />
				<input type="hidden" name="page" value="${page }" />
			</form>
			<div class="tblBtnArea space-between">
				<c:if test="${data.r_pay_status == 1 }">
					<!-- 대관 완료 -->
					<button id="cancleRental">예약 취소</button>
				</c:if>
			
				<a href="javascript:history.back();" class="active">확인</a>
			</div>
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
		
</body>
<script type="text/javascript">
    $(window).load(function(){
      $(".slide-wrap").flexslider({
        animation: "slide",
        pauseOnHover:true,
        start: function(slider){
        }
      });
    });
</script>
</html>