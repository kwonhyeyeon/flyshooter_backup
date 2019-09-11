<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기장 등록</title>
</head>
<body>
<ul>
	<li><label>날짜 별 요금</label>
			<label>평일 주간 요금</label> <input type="text" name="s_d_fee" id="s_d_fee"/>
			<label>평일 야간 요금</label> <input type="text" name="s_n_fee" id="s_n_fee"/></li>
	<li>
			<label>주말 주간 요금</label> <input type="text" name="s_d_fee_w" id="s_d_fee"/>
			<label>주말 야간 요금</label> <input type="text" name="s_n_fee_w" id="s_n_fee"/></li>
	<li>
			<label>최소 이용 가능 시간</label>  
			<select name="s_hours" class="s_hours">
				<option value="" selected disabled hidden>최소 이용 가능 시간 선택</option>
				<option value="1">1시간</option>
				<option value="2">1시간 30분</option>
				<option value="3">2시간</option>
			</select>
		</li>
	<li>
		<label>수용 인원</label> <input type="text" name="s_people" id="s_people"/>
		<label>경기장 명</label> <input type="text" name="s_name" id="s_name"/>
	</li>
	<li>
		<label>경기장 사이즈</label>  <select name="s_size" class="s_size">
			<option value="" selected disabled hidden>경기장 사이즈 선택</option>
			<option value="1">40*20</option>
			<option value="2">33*21</option>
			<option value="3">15*12</option>
		</select>
		<label>경기장 실내/외 선택</label> <select name="s_in_out" class="s_in_out">
			<option value="" selected disabled hidden>경기장 실내/외 선택</option>
			<option value="1">실내</option>
			<option value="2">실외</option>
		</select>
	</li>
	<li>
		<label>경기장 운영 시간</label> 
		<select name="s_open" class="s_open">
		<option value="" selected disabled hidden>오픈시간 선택</option>
		 <%
           for (int i = 1; i < 25; i++) {
                  %>
        <option value="<%=i%>"><%=i%>시</option>
                  <%
                }
                  %>
		</select> 
		<label>~</label> 
		<select name="s_close" class="s_close">
		<option value="" selected disabled hidden>마감시간 선택</option>
		 <%
            for (int i = 1; i < 25; i++) {
              %>
                  <option value="<%=i%>"><%=i%>시</option>
                  <%
                     }
                  %>
		</select>
		</li>
	<li>
		<label>경기장 사진</label>
		<input type="text" size="30" id="img1"/>
		<img src="" onclick="document.getElementById('file').click();">
		<input id="img1" type="file" onchange="document.getElementById('img1').value=this.value;" accept=".gif, .jpg, .png">
		<input type="text" size="30" id="img2"/>
		<img src="" onclick="document.getElementById('file').click();">
		<input id="img2" type="file" onchange="document.getElementById('img2').value=this.value;" accept=".gif, .jpg, .png">
		<input type="text" size="30" id="img3"/>
		<img src="" onclick="document.getElementById('file').click();">
		<input id="img3" type="file" onchange="document.getElementById('img3').value=this.value;" accept=".gif, .jpg, .png">
	</li>
	<li>
		<input type="button" value="등록완료">
		<input type="button" value="추가 등록하기">
		</li>
</ul>
</body>
</html>