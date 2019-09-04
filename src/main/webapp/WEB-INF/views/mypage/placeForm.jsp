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
<body>
	<div class="contentContainer">
		<div class="contentTit"><h3> 구장 등록</h3></div>
		<div class="contentTB">
			<form id="p_writeForm" name="p_writeForm">
				<table id="boardWrite">
					<colgroup>
						<col width="10%"/>
						<col width="10%"/>
					</colgroup>
					<tr>
					 <td class="p_name">구장명</td> <td><input type="text" name="p_name"></td>
					 </tr>
					 <tr>
					 <td class="p_ceo">대표자명</td> <td><input type="text" name="p_ceo"></td>
					 <td class="p_num">사업자&nbsp;번호</td> <td><input type="text" name="p_num"></td>
					 </tr>
					 <tr>
					 <td class="p_phone">구장&nbsp;전화번호</td> <td><input type="number" name="p_phone"></td>
					 </tr>
					 <tr>
					 	<td class="p_address">구장 주소</td>
					 	<td><input type="text" name="p_address1" placeholder="우편번호"></td>
					 	<td><input type="button" name="addressplace"></td>
					 </tr>
					 	<tr>
					 		<td><input type="text" name="p_address2" placeholder="주소" ></td>
					 	</tr>
					 	<tr>
					 		<td><input type="text" name="p_address3" placeholder="상세주소"></td>
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
							<td class="p_account">예금주명<input type="text" name="p_account"></td>
					 	</tr>
					 	<tr>
					 		<td class="p_account_num">입금&nbsp;계좌번호</td><td><input type="text" name="p_account_num"></td>
					 	</tr>
					 	<tr>
					 		<td class="p_holiday">정기휴일</td>
					 		<td>
					 		<select name="p_holiday">
					 			<option value="0">연중무휴</option>
					 			<option value="1">월요일</option>
					 			<option value="2">화요일</option>
					 			<option value="3">수요일</option>
					 			<option value="4">목요일</option>
					 			<option value="5">금요일</option>
					 			<option value="6">토요일</option>
					 			<option value="7">일요일</option>
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
					 	<td><input name="p_file" type="radio" value="1">파일첨부 &nbsp; 
					 		<input name="p_file" type="radio" value="2">팩스 &nbsp;
					 		<input name="p_file" type="radio" value="3">등기 &nbsp;
					 		<input name="p_file" type="radio" value="4">메일 &nbsp;
					 	</td>
					 </tr>
					 <tr>
					 		
					 </tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>