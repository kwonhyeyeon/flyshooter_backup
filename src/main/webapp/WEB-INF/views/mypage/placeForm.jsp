<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 등록</title>
<link rel="stylesheet" href="/resources/css/reset.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<script src="http://code.jquery.com/jquery.min.js">
$("#p_register").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$(".select_p_register img").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
$("#p_account_copy").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$(".select_p_account_copy img").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
$("#p_property").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
	    reader.onload = function(data) {
	    	$(".select_p_property img").attr("src", data.target.result).width(500);        
	    }
	reader.readAsDataURL(this.files[0]);
	}
});
</script>
<script type="text/javascript" src="/resources/js/placeForm.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- 다음 우편 주소 api-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
</head>
<body>

	<div id="header-wrap">
		<jsp:include page="../templates/header.jsp" flush="true" />
	</div>

	<div class="sub-v"></div>

	<article id="contents">
		<h3> 구장 등록</h3>
		<div class="placeForm">
			<form name="p_placeForm" id="p_placeForm" action="/mypage/placeInsert.do" method="post" enctype="multipart/form-data">
					 <div>구장명&nbsp;<input type="text" name="p_name" id="p_name"></div>
					 	<div>대표자명&nbsp;<input type="text" name="p_ceo" id="p_ceo" ></div>
					 	<label>사업자번호&nbsp;</label><input type="text" name="p_num" id="p_num"/><span id="pncheck"></span>
					 	<div>구장전화번호&nbsp;<input type="text" name="p_phone" id="p_phone" placeholder="-포함 작성"></div>
					 	<div class="p_address">구장 주소
					 		<input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					 		<br><input type="text" name="sample6_address" id="sample6_address" placeholder="주소" >
					 		<br><input type="text" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소">
					 		<br><input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목">
					 			<!-- 우편번호+ 주소 + 상세주소 + 참고항목 -->
					 			<input type="hidden" id="p_address" name="p_address" placeholder="저장될때 합쳐진 주소" >
					 		</div>
					 		<div class="p_bank">은행명 	
					 		<select name="p_bank" class="p_bank" id="p_bank">
					 			<option value="" selected disabled>은행 선택</option>
					 			<option value="신한">신한</option>
					 			<option value="우리">우리</option>
					 			<option value="농협">농협</option>
					 		</select>
					 		</div>
							<div class="p_account">예금주명&nbsp;<input type="text" name="p_account" id="p_account"></div>
					 		<div class="p_account_num">입금계좌번호&nbsp;<input type="text" name="p_account_num" id="p_account_num"></div>
					 		<div class="p_holiday">정기휴일
					 		<select name="p_holiday" class="p_holiday">
					 			<option value="" selected disabled>정기휴일 선택</option>
					 			<option value="0">월요일</option>
					 			<option value="1">화요일</option>
					 			<option value="2">수요일</option>
					 			<option value="3">목요일</option>
					 			<option value="4">금요일</option>
					 			<option value="5">토요일</option>
					 			<option value="6">일요일</option>
					 			<option value="7">연중무휴</option>
					 		</select>
					 		</div>
					 	<div class="p_open">오픈시간&nbsp;
               <select name="p_open" class="p_open">
               <option value="" selected disabled>오픈시간 선택</option>
                  <%
                     for (int i = 1; i < 25; i++) {
                  %>
                  <option value="<%=i%>"><%=i%>시</option>
                  <%
                     }
                  %>
               </select>
            </div>
            <div class="p_close">마감시간&nbsp;
               <select name="p_close" class="p_close">
               <option value="" selected disabled>마감시간 선택</option>
                  <%
                     for (int i = 1; i < 25; i++) {
                  %>
                  <option value="<%=i%>"><%=i%>시</option>
                  <%
                     }
                  %>
               </select>
            </div>
					 <div class="p_file">서류 제출 유형</div>
					 	<div>
					 		<label for = "p_file1">첨부파일</label>
							<input type="radio" name="p_file" id="p_file1" value="1" onclick="checkBox()">	
					 		<label for = "p_file2">팩스</label>
					 		<input type="radio" name="p_file" id="p_file2" value="2" onclick="checkBox()">
					 		<label for = "p_file3">등기</label>
					 		<input type="radio" name="p_file" id="p_file3" value="3" onclick="checkBox()">
					 		<label for = "p_file4">메일</label>
					 		<input type="radio" name="p_file" id="p_file4" value="4" onclick="checkBox()">
					 	</div>
						 <div>
						 <!-- 라디오버튼 클릭 할때 마다 보여질 내용 -->
						 	<div id="1" style="display:none">	
					사업자 등록증<input type="text" size="30" id="txt"/>
					<img src="" onclick="document.getElementById('file').click();">
					<input name="file1" id="p_register" type="file" onchange="document.getElementById('txt').value=this.value;" accept=".gif, .jpg, .png">
					<div class="select_p_register img"><img src="" /></div>
					<br>통장사본<input type="text" size="30" id="txt1"/>
					<img src="" onclick="document.getElementById('file').click();">
					<input name="file2" id="p_account_copy" type="file" onchange="document.getElementById('txt1').value=this.value;" accept=".gif, .jpg, .png">
					<div class="select_p_account_copy img"><img src="" /></div>
					<br>부동산종합공부<input type="text" size="30" id="txt2"/>
					<img src="" onclick="document.getElementById('file').click();">
					<input name="file3" id="p_property" type="file" onchange="document.getElementById('txt2').value=this.value;" accept=".gif, .jpg, .png">
					 <div class="select_p_property img"><img src="" /></div>
					 	</div>
					 		<div id="2" style="display:none">
					 	팩스는 여기로 보내시면 됩니다!!
					 	</div>
					 		<div id="3" style="display:none">
					 	등기는 여기로 보내시면 됩니다!!
					 	</div>
					 		<div id="4" style="display:none">
					 	메일은 여기로 보내시면 됩니다!!
					 	</div>
					 	</div>
					 	<div class="p_intro">소개글
					 		<br><textarea name="p_intro">소개글 입니다!!</textarea>
					 	</div>				 						   
					 	<div><input type="submit" value="다음">&nbsp;
					 	<input type="button" id="placeListBtn" value="목록"></div>
			</form>
		</div>
	</article>
		
	<jsp:include page="../templates/footer.jsp" flush="true" />
	
</body>
</html>