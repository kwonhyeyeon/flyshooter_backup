<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 구단등록 약관동의 페이지</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeList.js"></script>
</head>
<body>
		<table>
		<tr>
		<td><input type="checkbox" id="checkAll" onclick="cAll();"><label for="c0"> 이용약관, 개인정보 수집 모두 동의합니다.</label></td>
		</tr>
		<tr>
		<td><input type="checkbox" id="c1" name="c1" value="" required ><label for="c1">이용약관(필수)</label></td>
		</tr>
		<tr>
		<td>
		<!-- html로 변경하기 -->
		<textarea rows="20" cols="30">가. 수집하는 이용약관 어쩌고 저쩌고     나. 이용 ~~~~~~~
다. 그렇다네요~~~~~
			</textarea>
		</td>	
		</tr>
		<tr>
		<td><input type="checkbox" id="c2" name="c2" value="" required><label for="c2">개인정보 수집(필수)</label></td>
		<tr>
		<td>
		<!-- html로 변경하기 -->
		<textarea rows="20" cols="30">가. 수집하는 개인정보 어쩌고 저쩌고   
		 나. 이용 ~~~~~~~
다. 그렇다네요~~~~~
			</textarea>
		</td>
		</tr>
		<tr>
		<td><input type="submit" value="동의" id="insertPlaceBtns"></td>	
		</tr>
		</table>
</body>
</html>