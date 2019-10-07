<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FLY SHOOTER</title>
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

	<div id="wrapper">
	
		<jsp:include page="../templates/header.jsp" flush="true" />
	
		<article id="contents">
			<h2 class="articleTit">경기장 등록</h2>
		
			<form id="stadiumForm" action="/mypage/stadiumInsert.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="p_num" value="${p_num}"/>
				<input type="hidden" name="select" id="select" value="0"/>
				
				<table class="detailTbl">
					<tr>
						<th>경기장 명</th>
						<td><input type="text" name="s_name" id="s_name"/></td>
					</tr>
					<tr>
						<th>경기장 사이즈</th>
						<td>
							<select name="s_size" class="s_size" id="s_size">
								<option value="" selected disabled>경기장 사이즈 선택</option>
								<option value="1">40*20</option>
								<option value="2">33*21</option>
								<option value="3">15*12</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>경기장 실내 / 외 선택</th>
						<td>
							<select name="s_in_out" class="s_in_out" id="s_in_out">
								<option value="" selected disabled>경기장 실내/외 선택</option>
								<option value="1">실내</option>
								<option value="2">실외</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th rowspan="5">날짜 별 요금</th>
						<td class="feeArea">
							<p>입력된 요금은 1시간 기준 요금이며 최소 시간을 2시간 선택하여도 변하지 않습니다</p>
						</td>
					</tr>
					<tr>
						<td class="feeArea">
							<label>평일 주간 요금</label>
							<input type="text" name="s_d_fee" id="s_d_fee"/>
						</td>
					</tr>
					<tr>
						<td class="feeArea">
							<label>평일 야간 요금</label>
							<input type="text" name="s_n_fee" id="s_n_fee"/>
						</td>
					</tr>
					<tr>
						<td class="feeArea">
							<label>주말 주간 요금</label>
							<input type="text" name="s_d_fee_w" id="s_d_fee_w"/>
						</td>
					</tr>
					<tr>
						<td class="feeArea last">
							<label>주말 야간 요금</label>
							<input type="text" name="s_n_fee_w" id="s_n_fee_w"/>
						</td>
					</tr>
					<tr>
						<th>최소 이용 가능 시간</th>
						<td>
							<select name="s_hours" id="s_hours" class="s_hours">
								<option value="" selected disabled>최소 이용 가능 시간 선택</option>
								<option value="1">1시간</option>
								<option value="2">2시간</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수용 인원</th>
						<td><input type="text" name="s_people" id="s_people"/></td>
					</tr>
					
					<tr>
						<td colspan="2" class="blank"></td>
					</tr>
					
					<tr>
						<th>경기장 이미지 1</th>
						<td>
							<div class="file-upload-wrapper">
			                	<input type="file" id="s_img1" name="file1" class="file-upload-native" accept="image/*" />
			                	<input type="text" class="file-upload-text" placeholder="이미지 찾기" disabled />
			                </div>
			                <div class="preview img-wrapper"></div>
						</td>
					</tr>
					<tr>
						<th>경기장 이미지 2</th>
						<td>
							<div class="file-upload-wrapper">
			                	<input type="file" id="s_img2" name="file2" class="file-upload-native" accept="image/*" />
			                	<input type="text" class="file-upload-text" placeholder="이미지 찾기" disabled />
			                </div>
			                <div class="preview img-wrapper"></div>
						</td>
					</tr>	
					<tr>
						<th>경기장 이미지 3</th>
						<td>
							<div class="file-upload-wrapper">
			                	<input type="file" id="s_img3" name="file3" class="file-upload-native" accept="image/*" />
			                	<input type="text" class="file-upload-text" placeholder="이미지 찾기" disabled />
			                </div>
			                <div class="preview img-wrapper"></div>
						</td>
					</tr>		
				</table>
				
				<div class="tblBtnArea space-between">
					<button id="stadiumPlus">추가 등록하기</button>
					<input type="submit" class="modify" value="등록">
				</div>

			</form>
		</article>
		
		<jsp:include page="../templates/footer.jsp" flush="true" />
	</div>
	
</body>
<!-- <script>
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

</script> -->
</html>