<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 상세보기 수정</title>
</head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#StadiumListBtn").click(function() {
		location = "/mypage/placeChoice.do"
	});
    var file1 = "<c:out value='${s_img1}'/>";
    if (file1 != "") {
       $("#fileImage1").attr({
          src : "/uploadStorage/image1/${s_img1}",
          width : "250px",
          height : "100px"
       });
    }
    var file2 = "<c:out value='${s_img2}'/>";
    if (file2 != "") {
       $("#fileImage2").attr({
          src : "/uploadStorage/image2/${s_img2}",
          width : "250px",
          height : "100px"
       });
    }
    var file3 = "<c:out value='${s_img3}'/>";
    if (file3 != "") {
       $("#fileImage3").attr({
          src : "/uploadStorage/image3/${s_img3}",
          width : "250px",
          height : "100px"
       });
    }
    $("#s_hours").val('${svo.s_hours}');
    $("#s_size").val('${svo.s_size}');
    $("#s_in_out").val('${svo.s_in_out}');
    $("#s_status").val('${svo.s_status}');
});
</script>
<body>
	<div class="contentContainer">
	<h3>${s_no}</h3>
		<div class="contentTB">
			<form id="s_stadiumModifyForm" action="/mypage/stadiumModify.do" method="post" enctype="multipart/form-data">
				<ul>
					<li><label>날짜 별 요금</label>
					평일 주간 요금 <input type="text" value="${svo.s_d_fee}" name="s_d_fee" id="s_d_fee"/>
					평일 야간 요금 <input type="text" value="${svo.s_n_fee}" name="s_n_fee" id="s_n_fee"/></li>
				
					<li>
						주말 주간 요금 <input type="text" value="${svo.s_d_fee_w}" name="s_d_fee_w" id="s_d_fee_w"/>
						주말 야간 요금 <input type="text" value="${svo.s_n_fee_w}" name="s_n_fee_w" id="s_n_fee_w"/>
					</li>
					<li>
						최소 이용 가능 시간 
						<select name="s_hours" id="s_hours">
							<option value="1">1시간</option>
							<option value="2">2시간</option>
						</select>
					</li>
					<li>
						<input type="hidden" name="s_no" value="${svo.s_no}"/>
						수용 인원 <input type="text" value="${svo.s_people}" name="s_people" id="s_people"/>
						경기장 명 <input type="text" value="${svo.s_name}" name="s_name" id="s_name"/>
					</li>
					<li>
						경기장 사이즈
						<select name="s_size" class="s_size" id="s_size">
							<option value="1">40*20</option>
							<option value="2">33*21</option>
							<option value="3">15*12</option>
						</select>
						
						경기장 실내/외 선택
						<select name="s_in_out" class="s_in_out" id="s_in_out">
							<option value="1">실내</option>
							<option value="2">실외</option>
						</select>
					</li>
					<li>
						<div class="inputArea">
 							<label>이미지1</label>
 							<input type="file" id="s_img1" name="file1"/>
 							<div class="fileImage1"><img id="fileImage1" src=""/></div>
						</div>
					</li>
					<li>
						<div class="inputArea">
 							<label>이미지2</label>
 							<input type="file" id="s_img2" name="file2"/>
 							<div class="fileImage2"><img id="fileImage2" src=""></div>
						</div>
						
					</li>
					<li>
						<div class="inputArea">
 							<label>이미지3</label>
 							<input type="file" id="s_img3" name="file3"/>
 							<div class="fileImage3"><img id="fileImage3" src=""></div>
						</div>
					</li>
					<li>
						경기장 상태
					<select name="s_status" id="s_status">
						<option value="0">close</option>
						<option value="1">open</option>
					</select>
					</li>
				</ul>
				<div>
					<input type="submit" value="수정하기"> 
					<input type="button" id="StadiumListBtn" value="목록">
				</div>
			</form>
		</div>
	</div>
</body>
<script>
$("#s_img1").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$("#fileImage1").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
$("#s_img2").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$("#fileImage2").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
$("#s_img3").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$("#fileImage3").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});

</script>
</html>