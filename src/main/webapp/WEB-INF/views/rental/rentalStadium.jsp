<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>FLY SHOOTER</title>
    <!-- datepicker를 사용하기 위한 css, js -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.12.4.js"></script>
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- end datepicker -->
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link rel="stylesheet" href="/resources/css/style.css" />
    <script type="text/javascript" src="/resources/js/rentalStadium.js"></script>
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.flexslider-min.js"></script>
</head>

<body>
    <div id="wrapper">

        <jsp:include page="../templates/header.jsp" flush="true" />

        <article id="contents">

            <h2 class="articleTit">${pvo.p_name} 경기장 예약</h2>

            <div class="selectArea">
                <select id="stadiumSelectBox" name="selectStadium" disabled>
                    <option>경기장 선택</option>
                    <c:forEach var="stadium" items="${ stadiumList }">
                        <option value="${ stadium.s_no },${ stadium.s_hours},${stadium.s_n_fee },${stadium.s_d_fee },${stadium.s_n_fee_w },${stadium.s_d_fee_w }">${ stadium.s_name }</option>
                    </c:forEach>
                </select>

                <input type="text" id="datepicker" class="calendar" placeholder="날짜를 선택하세요" readonly />
            </div>

            <section class="itemArea rentalInfo">
                <section class="placeInfo">
                    <div class="slide-wrap">
                        <ul class="slides">
                        	<li><img id="img1" src="" /></li>
                        	<li><img id="img2" src="" /></li>
                        	<li><img id="img3" src="" /></li>
                        </ul>
                    </div>
                </section>

                <table class="detailTbl">
                    <tr>
                        <th>구장명</th>
                        <td>${ pvo.p_name }</td>
                    </tr>
                    <tr>
                        <th>구장 주소</th>
                        <td id="adrs">${ pvo.p_address }</td>
                    </tr>
                    <tr>
                        <th>구장 전화번호</th>
                        <td>${ pvo.p_phone }</td>
                    </tr>
                    <tr>
                        <th>영업 시간</th>
                        <td>${ pvo.p_open } ~ ${ pvo.p_close } 시</td>
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
            </section>
            
               <div id="map" style="width:100%; height:400px; margin-bottom:50px;"></div>
            <!-- services 라이브러리 불러오기 -->
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f706d5a384eb0508472eddd23b44d733&libraries=services"></script>
            <script>
            //var address = $("#adrsText").replace("*");
            var add = "${ pvo.p_address }";
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
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${pvo.p_name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>

            <section class="itemArea">

                <form id="hidden_form">
                    <input type="hidden" value="${ pvo.p_holiday_start }" id="holiday_start" />
                    <input type="hidden" value="${ pvo.p_holiday_end }" id="holiday_end" />
                    <input type="hidden" value="${ pvo.p_holiday }" id="holiday" />

                    <input type="hidden" id="p_open" value="${ pvo.p_open }" />
                    <input type="hidden" id="p_close" value="${ pvo.p_close }" />
                </form>

                <h3 class="calTit" style="display:none;">예약 시간 선택</h3>
                <section id="selectTime">

                </section>

                <c:if test="${not empty itemsList}">
                    <section id="selectItem">
                        <p>용품 대여 가능한 구장입니다<br>추가 선택을 원하시면 버튼을 클릭해주세요</p>
                        <button id="showItems">용품 선택</button>

                        <div id="rentalItems">
                            <h3 class="calTit">용품 선택</h3>
                            <c:if test="${not empty itemsList}">
                                <table class="detailTbl">
                                    <c:forEach var="item" items="${ itemsList }" varStatus="status">
                                        <tr data-num="${ item.i_rental_fee }">
                                            <th>
                                                <p style="display:none" class="i_no">${ item.i_no }</p>${item.i_name }
                                            </th>
                                            <td><input type="number" class="i_ea" placeholder="0" /></td>
                                            <td>대여료</td>
                                            <td>
                                                <fmt:formatNumber value="${item.i_rental_fee}" pattern="#,###" /> 원</td>
                                            <td class="price">0원</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <input type="hidden" value="${itemsList.size()}" id="items_ec" placeholder="0" />
                            </c:if>

                            <!-- <button id="hideItems">옵션닫기</button> -->
                        </div>
                    </section>
                </c:if>

                <section class="stadiumCal" style="display:none;">
                    <p>옵션 <span id="itemsPrice">0</span> 원</p>
                    <p>대관료 <span id="payment">0</span> 원</p>
                    <p class="marginTop">총 결제금액 <span id="totalMoney">0</span> 원</p>

                    <div class="btnArea">
                        <button id="goRentalBtn" class="active">결제</button>
                    </div>
                </section>

            </section>

            <div id="dialog" title="결제창" style="display: none">
                <form id="insertRentalForm">
                    <input type="hidden" id="r_reserve_date" name="r_reserve_date" />
                    <input type="hidden" id="s_no" name="s_no" />
                    <input type="hidden" id="r_start" name="r_start" />
                    <input type="hidden" id="r_total_pay" name="r_total_pay" />
                    <input type="hidden" id="r_pay_type" name="r_pay_type" />
                    <input type="hidden" id="r_bank" name="r_bank" />
                    <input type="hidden" id="r_account_num" name="r_account_num" />
                    <input type="hidden" id="r_account" name="r_account" />
                    <input type="hidden" id="items_no" name="items_no" />
                    <input type="hidden" id="items_ea" name="items_ea" />
                </form>

                <div class="input-custom">
                    <div class="radio-box">
                        <input type="radio" name="r_pay_type" value="2" id="account" checked />
                        <label for="account">계좌이체</label>
                        <span class="radio-check"></span>
                    </div>

                    <div class="radio-box">
                        <input type="radio" name="r_pay_type" value="1" id="card" />
                        <label for="card">카드결제</label>
                        <span class="radio-check"></span>
                    </div>
                </div>

                <div id="accountTransfer">
                    <table class="detailTbl">
                        <tr>
                            <th>은행</th>
                            <td>
                            	<select name="bank" id="bankSelect">
                            		<option value="">은행 선택</option>
                            		<option value="신한">신한</option>
                            		<option value="우리">우리</option>
                            		<option value="농협">농협</option>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <th>출금 계좌</th>
                            <td><input type="text" class="input" id="outNum" /></td>
                        </tr>
                        <tr>
                            <th>예금주</th>
                            <td><input type="text" class="input" id="outName" /></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" class="input" id="outPw" /></td>
                        </tr>
                        
                        <tr>
                            <td class="blank" colspan="2"></td>
                        </tr>
                        
                        <tr>
                            <th>은행</th>
                            <td>
                            	<select name="r_bank" id="rbankSelect">
                            		<option value="">은행 선택</option>
                            		<option value="신한">신한</option>
                            		<option value="우리">우리</option>
                            		<option value="농협">농협</option>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <th>환불 계좌</th>
                            <td><input type="text" id="r_ac_num" class="input" /></td>
                        </tr>
                        <tr>
                            <th>예금주</th>
                            <td><input type="text" id="r_ac" class="input" /></td>
                        </tr>
                    </table>
                </div>

                <div id="creditCard">
                	<div class="selectArea">
	                	<select id="selectCard">
	                    	<option value="선택하세요">선택하세요</option>
	                        <option value="BC카드">BC카드</option>
	                        <option value="국민카드">국민카드</option>
	                        <option value="신한카드">신한카드</option>
	                    </select>
                    </div>
                    
                    <div class="cardArea">
                    	<input type="text" class="cardNum" /><span>-</span> 
                    	<input type="text" class="cardNum" /><span>-</span>  
                    	<input type="text" class="cardNum" /><span>-</span>  
                    	<input type="text" class="cardNum" />
                    </div>
                </div>
                
                <p class="totalPrice">총 결제금액 <span id="total_money"></span> 원</p>
            </div>

        </article>
        <jsp:include page="../templates/footer.jsp" flush="true" />

    </div>
</body>
<script type="text/javascript">
    $(window).load(function() {
        $(".slide-wrap").flexslider({
        });
    });
</script>
</html>