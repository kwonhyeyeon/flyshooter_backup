<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 등록</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/stadiumForm.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script>
$(document).ready(function(){
	$("#stadiumForm").submit(function() {
		return stadiumCheck();
	});
	// 추가 버튼 클릭 시 처리 이벤트
	$("#stadiumPlus").click(function() {
		$("#select").attr({
			"value" : "1"
		});

		$("#stadiumForm").submit();
	});
	errCodeCheck();
});
function errCodeCheck() {
	var errCode = '<c:out value = "${errCode}"/>';
	if (errCode != "") {
		//명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환.
		switch (parseInt(errCode)) {
		case 1:
			alert("사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도 해주세요.");
			return false;
		}
	}
}
</script>
</head>
<body>

	<div id="header-wrap">
		<jsp:include page="../templates/header.jsp" flush="true" />
	</div>
	
	<div class="sub-v"></div>
	<article id="contents">
		<form id="stadiumForm" action="/mypage/stadiumInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="p_num" value="${p_num}"/>
		<input type="hidden" name="select" id="select" value="0"/>
		<ul>
			<li><label>날짜 별 요금</label>
					<label>평일 주간 요금</label> <input type="text" name="s_d_fee" id="s_d_fee"/>
					<label>평일 야간 요금</label> <input type="text" name="s_n_fee" id="s_n_fee"/></li>
			<li>
					<label>주말 주간 요금</label> <input type="text" name="s_d_fee_w" id="s_d_fee_w"/>
					<label>주말 야간 요금</label> <input type="text" name="s_n_fee_w" id="s_n_fee_w"/></li>
			<li>
					<label>최소 이용 가능 시간</label>  
					<select name="s_hours" id="s_hours" class="s_hours">
						<option value="" selected disabled hidden>최소 이용 가능 시간 선택</option>
						<option value="1">1시간</option>
						<option value="2">2시간</option>
					</select>
				</li>
			<li>
				<label>수용 인원</label> <input type="text" name="s_people" id="s_people"/>
				<label>경기장 명</label> <input type="text" name="s_name" id="s_name"/>
			</li>
			<li>
				<label>경기장 사이즈</label>  
				<select name="s_size" class="s_size" id="s_size">
					<option value="" selected disabled hidden>경기장 사이즈 선택</option>
					<option value="1">40*20</option>
					<option value="2">33*21</option>
					<option value="3">15*12</option>
				</select>
				<label>경기장 실내/외 선택</label> 
				<select name="s_in_out" class="s_in_out" id="s_in_out">
					<option value="" selected disabled hidden>경기장 실내/외 선택</option>
					<option value="1">실내</option>
					<option value="2">실외</option>
				</select>
			</li>
			<li>
				<label>경기장 사진</label>
			</li>
			<li>
			<div class="inputArea">
		 		<label for="s_img1">이미지1</label>
		 		<input type="file" id="s_img1" name="file1" />
		 		<div class="select_img1"><img src="" /></div>
			</div>
			</li>
			<li>
			<div class="inputArea">
		 		<label for="s_img2">이미지2</label>
		 		<input type="file" id="s_img2" name="file2" />
		 		<div class="select_img2"><img src="" /></div>
			</div>
			</li>
			<li>
			<div class="inputArea">
		 		<label for="s_img3">이미지3</label>
		 		<input type="file" id="s_img3" name="file3" />
		 		<div class="select_img3"><img src="" /></div>
			</div>
			</li>
		</ul>
		<div>
				<input type="submit" value="등록완료">
				<input type="button" id="stadiumPlus" value="추가 등록하기">
				<a href="/">Home</a>
		</div>
		</form>
	</article>
	
	<jsp:include page="../templates/footer.jsp" flush="true" />
		
</body>
<script>
$("#s_img1").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$(".select_img1 img").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
$("#s_img2").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$(".select_img2 img").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
$("#s_img3").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$(".select_img3 img").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});

</script>
</html>