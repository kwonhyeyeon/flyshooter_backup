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
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/placeForm.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<!-- 다음 우편 주소 api-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
</head>
<body>
	
	<div id="wrapper">
	
		<jsp:include page="../templates/header.jsp" flush="true" />
		
		<article id="contents">
			<h2 class="articleTit">구장 등록</h2>
			
			<section class="itemArea">
			
				<form name="p_placeForm" id="p_placeForm" action="/mypage/placeInsert.do" method="post">
				
				</form>
			
			</section>
			
			<div class="placeForm">
				<form name="p_placeForm" id="p_placeForm" action="/mypage/placeInsert.do" method="post">
				
					<table class="detailTbl">
						<tr>
							<th>구장명</th>
							<td><input type="text" name="p_name" id="p_name" /></td>
						</tr>
						<tr>
							<th>대표자명</th>
							<td><input type="text" name="p_ceo" id="p_ceo" /></td>
						</tr>
						<tr>
							<th>사업자번호</th>
							<td>
								<input type="text" name="p_num" id="p_num" />
								<p id="pncheck" class="error"></p>
							</td>
						</tr>
						<tr>
							<th>구장 전화번호</th>
							<td><input type="text" name="p_phone" id="p_phone" placeholder="(-) 미 포함 작성" /></td>
						</tr>
						<tr>
							<th>구장 주소</th>
							<td>
								<input type="hidden" id="p_address" name="p_address" />
								<section class="postArea">
									<input type="text" name="sample6_postcode" id="sample6_postcode" class="post" placeholder="우편번호" />
									<input type="button" onclick="sample6_execDaumPostcode()" class="postBtn" value="우편번호 찾기" />
								</section>
								
								<section class="adrsArea">
									<input type="text" name="sample6_address" id="sample6_address" placeholder="주소" />
						 		<input type="text" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소" />
						 		<input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목" />
								</section>
							</td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>은행명</th>
							<td>
								<select name="p_bank" class="p_bank" id="p_bank">
						 			<option selected disabled>은행 선택</option>
						 			<option value="신한">신한</option>
						 			<option value="우리">우리</option>
						 			<option value="농협">농협</option>
						 		</select>
							</td>
						</tr>
						<tr>
							<th>예금주명</th>
							<td><input type="text" name="p_account" id="p_account" /></td>
						</tr>
						<tr>
							<th>입금 계좌번호</th>
							<td><input type="text" name="p_account_num" id="p_account_num" /></td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>정기 휴일</th>
							<td>
								<select name="p_holiday" class="p_holiday">
						 			<option selected disabled>정기휴일 선택</option>
						 			<option value="0">월요일</option>
						 			<option value="1">화요일</option>
						 			<option value="2">수요일</option>
						 			<option value="3">목요일</option>
						 			<option value="4">금요일</option>
						 			<option value="5">토요일</option>
						 			<option value="6">일요일</option>
						 			<option value="7">연중무휴</option>
						 		</select>
							</td>
						</tr>
						<tr>
							<th>오픈 시간</th>
							<td>
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
							</td>
						</tr>
						<tr>
							<th>마감 시간</th>
							<td>
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
							</td>
						</tr>
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>서류 제출 유형</th>
							<td>
								<div class="radio-box">
									<input type="radio" name="p_file" id="p_file1" value="1" onclick="checkBox()">	
							 		<label for="p_file1">첨부파일</label>
							 		<span class="radio-check"></span>
						 		</div>
						 		<div class="radio-box">
						 			<input type="radio" name="p_file" id="p_file2" value="2" onclick="checkBox()">
						 			<label for="p_file2">팩스</label>
						 			<span class="radio-check"></span>
						 		</div>
						 		<div class="radio-box">
						 			<input type="radio" name="p_file" id="p_file3" value="3" onclick="checkBox()">
						 			<label for="p_file3">등기</label>
						 			<span class="radio-check"></span>
						 		</div>
						 		<div class="radio-box">
						 			<input type="radio" name="p_file" id="p_file4" value="4" onclick="checkBox()">
						 			<label for="p_file4">메일</label>
						 			<span class="radio-check"></span>
						 		</div>
						 		
						 		<p class="d-fax documentText">팩스 보낼 전화번호</p>
						 		<p class="d-adrs documentText">등기 보낼 주소</p>
						 		<p class="d-mail documentText">메일 보낼 주소</p>
							</td>
						</tr>
						
						<!-- 첨부파일 -->
						<tr class="file">
							<th>사업자 등록증</th>
							<td>
								<input type="text" size="30" id="txt"/>
								<!-- <img src="" onclick="document.getElementById('file').click();"> -->
								<input name="p_register" id="p_register" type="file" onchange="document.getElementById('txt').value=this.value;" accept=".gif, .jpg, .png">
							</td>
						</tr>
						<tr class="file">
							<th>통장 사본</th>
							<td>
								<input type="text" size="30" id="txt1"/>
								<!-- <img src="" onclick="document.getElementById('file').click();"> -->
								<input name="p_account_copy" id="p_account_copy" type="file" onchange="document.getElementById('txt1').value=this.value;" accept=".gif, .jpg, .png">
							</td>
						</tr>
						<tr class="file">
							<th>부동산종합공부</th>
							<td>
								<input type="text" size="30" id="txt2"/>
								<!-- <img src="" onclick="document.getElementById('file').click();"> -->
								<input name="p_property" id="p_property" type="file" onchange="document.getElementById('txt2').value=this.value;" accept=".gif, .jpg, .png">
							</td>
						</tr>
						<!-- 첨부파일 -->
						
						<tr>
							<td colspan="4" class="blank"></td>
						</tr>
						
						<tr>
							<th>소개글</th>
							<td><textarea name="p_intro" placeholder="소개글을 작성해주세요"></textarea></td>
						</tr>
					</table>
					
					<div class="tblBtnArea space-between">
						<a href="/mypage/placeList.do" id="placeListBtn">목록</a>
						<input type="submit" class="modify" value="다음"> 
					</div>
				 						   
				</form>
			</div>
		</article>
			
		<jsp:include page="../templates/footer.jsp" flush="true" />
		
	</div>
	
</body>
</html>