<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장 등록</title>
</head>
<script type="text/javascript">
</script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeForm.js"></script>
<!-- 다음 우편 주소 api-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3> 구장 등록</h3></div>
		<div class="contentTB">
			<form id="p_placeForm" action="/mypage/placeInsert.do" method="post">
				<table id="boardWrite">
					<tr>
					 <td class="p_name">구장명</td> <td><input type="text" name="p_name"></td>
					 </tr>
					 <tr>
					 	<td class="p_ceo">대표자명</td> <td><input type="text" name="p_ceo"></td>
					 	<td class="p_num">사업자번호</td> <td><input type="text" name="p_num"></td>
					 </tr>
					 <tr>
					 	<td class="p_phone">구장전화번호</td><td><input type="number" name="p_phone"></td>
					 </tr>
					 <tr>
					 	<td class="p_address">구장 주소</td>
					 		<td><input type="text" id="sample6_postcode" placeholder="우편번호">
					 		<br><input type="text" id="sample6_address" placeholder="주소" >
					 		<br><input type="text" id="sample6_detailAddress" placeholder="상세주소">
					 		<br><input type="text" id="sample6_extraAddress" placeholder="참고항목">
					 		</td>
					 		<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
					 </tr>
					 	<tr>
					 		<td class="p_bank">은행명</td> 
					 		<td>
					 		<select name="p_bank">
					 			<option value="신한">신한</option>
					 			<option value="우리">우리</option>
					 			<option value="농협">농협</option>
					 		</select>
						</td>
							<td class="p_account">예금주명&nbsp;<input type="text" name="p_account"></td>
					 	</tr>
					 	<tr>
					 		<td class="p_account_num">입금계좌번호</td><td><input type="text" name="p_account_num"></td>
					 	</tr>
					 	<tr>
					 		<td class="p_holiday">정기휴일</td>
					 		<td>
					 		<select name="p_holiday">
					 			<option value="0">일요일</option>
					 			<option value="1">월요일</option>
					 			<option value="2">화요일</option>
					 			<option value="3">수요일</option>
					 			<option value="4">목요일</option>
					 			<option value="5">금요일</option>
					 			<option value="6">토요일</option>
					 		</select>
					 		</td>
					 		<td class="p_open">오픈시간</td>
					 	<td><select name="p_open">
					 		<option value="00">0시</option>
					 				<option value="01">1시</option>
					 				<option value="02">2시</option>
					 				<option value="03">3시</option>
					 				<option value="04">4시</option>
					 				<option value="05">5시</option>
					 				<option value="06">6시</option>
					 				<option value="07">7시</option>
					 				<option value="08">8시</option>
					 				<option value="09">9시</option>
					 				<option value="10">10시</option>
					 				<option value="11">11시</option>
					 				<option value="12">12시</option>
					 				<option value="13">13시</option>
					 				<option value="14">14시</option>
					 				<option value="15">15시</option>
					 				<option value="16">16시</option>
					 				<option value="17">17시</option>
					 				<option value="18">18시</option>
					 				<option value="19">19시</option>
					 				<option value="20">20시</option>
					 				<option value="21">21시</option>
					 				<option value="22">22시</option>
					 				<option value="23">23시</option>
					 				<option value="24">24시</option>
					 	</select>
					 	</td>		
					 	<td class="p_close">마감시간</td>
					 	<td><select name="p_close">
					 		<option value="00">0시</option>
					 				<option value="01">1시</option>
					 				<option value="02">2시</option>
					 				<option value="03">3시</option>
					 				<option value="04">4시</option>
					 				<option value="05">5시</option>
					 				<option value="06">6시</option>
					 				<option value="07">7시</option>
					 				<option value="08">8시</option>
					 				<option value="09">9시</option>
					 				<option value="10">10시</option>
					 				<option value="11">11시</option>
					 				<option value="12">12시</option>
					 				<option value="13">13시</option>
					 				<option value="14">14시</option>
					 				<option value="15">15시</option>
					 				<option value="16">16시</option>
					 				<option value="17">17시</option>
					 				<option value="18">18시</option>
					 				<option value="19">19시</option>
					 				<option value="20">20시</option>
					 				<option value="21">21시</option>
					 				<option value="22">22시</option>
					 				<option value="23">23시</option>
					 				<option value="24">24시</option>
					 	</select>
					 	</td>		
					 	</tr>
					 <tr>
					 	<td class="p_status">구장 상태</td>
					 	<td><select name="p_status">
					 		<option value="0">운영전</option>
					 		<option value="1">운영중</option>
					 	</select>
					 	</td>
					 </tr>
					 <tr>
					 <td class="p_file">서류 제출 유형</td>
					 	<td>
					 		<label for = "p_file1">첨부파일</label>
							<input type="radio" name="p_file" id="p_file1" value="" onclick="checkBox()">	
					 		<label for = "p_file2">팩스</label>
					 		<input type="radio" name="p_file" id="p_file2" value="" onclick="checkBox()">
					 		<label for = "p_file3">등기</label>
					 		<input type="radio" name="p_file" id="p_file3" value="" onclick="checkBox()">
					 		<label for = "p_file4">메일</label>
					 		<input type="radio" name="p_file" id="p_file4" value="" onclick="checkBox()">
					 	</td>
					 </tr>
					 <tr>
						 <td>
						 <!-- 보여질 내용 -->
						 <div id="1" style="display:none">	
					사업자 등록증<input name="myFile" type="file"><br>통장사본<input name="myFile" type="file"><br>부동산종합공부<input name="myFile" type="file">
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
					 	</td>
					 </tr>
					 <tr>
					 	<td class="p_intro">소개글</td>
					 	<td><textarea rows="2" cols="5"></textarea>
					 		</td>				 	
					 </tr>  
					  <tr>
					 	<td><input type="submit" id="placeInsertBtn" name="placeInsertBtn" value="다음"></td>
					 	<td><input type="button" id="placeListBtn" value="목록"></td>
					 </tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>